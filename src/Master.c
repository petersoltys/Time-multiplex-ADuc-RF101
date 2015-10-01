/**
 *****************************************************************************
   @example  Master.c
   @brief    prigram used for Receiving data in time multiplex
             data are received via RF Interface and sended to UART
             working with Slave.c
             tested on ADucRF101MKxZ

             

   @version  V1.3
   @author   Peter Soltys
   @date     august 2015  

   @par Revision History:
   - V1.1, July 2015  : initial version. 
   - V1.2, august 2015  : fully  functional.    
   - V1.3, september 2015  : faster version with higher throughput


note : in radioeng.c was changed intial value from
    static RIE_BOOL             bPacketTx                     = RIE_FALSE; 
    static RIE_BOOL             bPacketRx                     = RIE_FALSE; 
to 
    static RIE_BOOL             bPacketTx                     = RIE_TRUE; 
    static RIE_BOOL             bPacketRx                     = RIE_TRUE; 

**/
#include "include.h"
#include "settings.h"

#define LED_OFF DioSet(pADI_GP4,BIT2)//led off
#define LED_ON  DioClr(pADI_GP4,BIT2)//led on



RIE_Responses  RIE_Response = RIE_Success;
unsigned char  Buffer[255];
RIE_U8         PktLen;
RIE_S8         RSSI;


//[slave ][ packet][packet data]
char pktMemory[NUM_OF_SLAVE][10][255];
//pktMemory have 10200 Bytes and ADuc rf101 have only 16KBytes SRAM
//because of this restriction is nesesary for right function to be UART much faster(tested on 128000 baud rate) than RF-link

signed char numOfPkt [2][NUM_OF_SLAVE] = {{-1,-1,-1,-1},{-1,-1,-1,-1}};//similar as pktMemory
/*
  numOfPkt is 2 levels deep 
  puspose is changing in circle 
  0 actual receiving buffer
  1 actual sending buffer
  for pointing are used flags : actualRxBuffer, actualTxBuffer
*/
signed char actualRxBuffer=0,actualTxBuffer=1;



unsigned char SID;//Slave ID
signed char send=0;
signed char nextRxPkt=0;

signed char TX_flag=0,RX_flag=0,terminate_flag=0,flush_flag=0;
signed char firstRxPkt = 0;

signed char dmaTxSlv=0,dmaTxPkt=0,dmaTx_flag=0;//variables for DMA_UART_TX_Int_Handler
char* dmaTxPtr;
#if THROUGHPUT_MEASURE
int rxThroughput;
int txThroughput;
#endif


void DMA_UART_TX_Int_Handler (void);


/*
* initializing uart port
* speed UART_BAUD_RATE_MASTER baud
* 8 bits
* one stop bit
* output port P1.0\P1.1
*/
void uartInit(void){
  UrtLinCfg(0,UART_BAUD_RATE_MASTER,COMLCR_WLS_8BITS,COMLCR_STOP_DIS);
  DioCfg(pADI_GP1,0x9); // UART functionality on P1.0\P1.1
  
  DmaInit();// Create DMA descriptor
  DmaTransferSetup(UARTTX_C,  20,   Buffer);
  NVIC_EnableIRQ ( DMA_UART_TX_IRQn );// Enable DMA UART TX interrupt
}

/*
* inicializovanie portu na ktorom je pripojena user specified led
*/
void ledInit(void){
    // P4.2  as output
  DioCfg(pADI_GP4,0x10);
  DioOen(pADI_GP4, BIT2); 
}

/* 
* this function set general purpose timer1 to blinking with led on P4.2
* see void GP_Tmr1_Int_Handler ()
*/
void blink(unsigned int time){
  GptLd (pADI_TM1, time); // Interval of 5s
  GptCfg(pADI_TM1, TCON_CLK_LFOSC, TCON_PRE_DIV32768, TCON_ENABLE|TCON_MOD_PERIODIC);
  while (GptSta(pADI_TM1)& TSTA_CON); // wait for sync of TCON write. required because of use of asynchronous clock
  GptClrInt(pADI_TM1,TCLRI_TMOUT);
  while (GptSta(pADI_TM1)& TSTA_CLRI); // wait for sync of TCLRI write. required because of use of asynchronous clock
  NVIC_EnableIRQ(TIMER1_IRQn);
}
void blinkDisable(){
  NVIC_DisableIRQ(TIMER1_IRQn);
  pADI_GP4->GPSET |= 0x04;
}

/*
* function for initialise the Radio
* funkcia na inicialiyovanie radioveho prenosu
*/
void radioInit(void){
  // Initialise the Radio
  if (RIE_Response == RIE_Success)
     RIE_Response = RadioInit(RADIO_CFG);  
  // Set the Frequency to operate at 433 MHz
  if (RIE_Response == RIE_Success)
     RIE_Response = RadioSetFrequency(RADIO_FREQENCY);
  // Set modulation type
  if (RIE_Response == RIE_Success)
     RadioSetModulationType(RADIO_MODULATION);
  // Set the PA and Power Level
  if (RIE_Response == RIE_Success)
     RIE_Response = RadioTxSetPA(PA_TYPE,RADIO_POWER);
  // Set data whitening
  if (RIE_Response == RIE_Success)
     RIE_Response = RadioPayldDataWhitening(DATA_WHITENING);
  // Set data Manchaster encoding
  if (RIE_Response == RIE_Success)
    RadioPayldManchesterEncode(RADIO_MANCHASTER);
}

#include <stdarg.h>
/*
* send one packet on UART with DMA controller
* before call this function is nessesary to initialize UART
*/
void  dmaSend(unsigned char* buff, int len){
  //DMA UART stream
  DmaChanSetup(UARTTX_C,ENABLE,ENABLE);// Enable DMA channel  
  DmaTransferSetup(UARTTX_C,len,buff);
  UrtDma(0,COMIEN_EDMAT);
}

/*
* this function is equivalent to function printf from library stdio.h
* output stream is managed with DMA controller 
* before call this function is nessesary to initialize UART
*/
int dma_printf(const char * format /*format*/, ...)
{
  char buff[256];
  unsigned char len;
  va_list args;
  va_start( args, format );
   
  len =vsprintf(buff, format,args);//vlozenie formatovaneho retazca do buff

  dmaSend(buff,len);

  va_end( args );
  return len;
}




/*
* send one packet trought radio
*
*/
void radioSend(char* buff, unsigned char len){
  if (RIE_Response == RIE_Success)  
    while(!RadioTxPacketComplete());
  
  if (RIE_Response == RIE_Success){
    RIE_Response = RadioTxPacketVariableLen(len, buff); 
  }
  if (RIE_Response == RIE_Success)//start again receiving mod
    RIE_Response = RadioRxPacketVariableLen(); 
#if THROUGHPUT_MEASURE
  txThroughput=txThroughput+len;
#endif
    //DMA UART stream
#if TX_STREAM
  DmaChanSetup(UARTTX_C,ENABLE,ENABLE);// Enable DMA channel  
  DmaTransferSetup(UARTTX_C,len-1,buff);
  UrtDma(0,COMIEN_EDMAT);
#endif
}

/*
* this function is equivalent to function printf from librarz stdio.h
* but output stream is throught radio transmitter
* before call this function is nessesary to initialize radio
* any one formated string (call) is sended in one packet
*/
unsigned char rf_printf(const char * format /*format*/, ...){
  char buff[256];
  unsigned char len;
  va_list args;
  va_start( args, format );

  len=vsprintf(buff, format,args);//vlozenie formatovaneho retazca do buff
  if(len>255){//kontrola maximalnej dlzky retazca
    va_end( args );
    return 0;
  }
      
  radioSend(buff,len+1);//send formated packet

  va_end( args );
  return len;
}

/*
* set timer in periodic cycle at interval aproximetly 10ms = 1time slot
* 
*/
void timeMultiplexInit(){
  GptLd (pADI_TM0, 1270); // Interval of 10ms
  GptCfg(pADI_TM0, TCON_CLK_UCLK, TCON_PRE_DIV256, TCON_ENABLE|TCON_MOD_PERIODIC);
  while (GptSta(pADI_TM0)& TSTA_CON); // wait for sync of TCON write. required because of use of asynchronous clock
  GptClrInt(pADI_TM0,TCLRI_TMOUT);
  while (GptSta(pADI_TM0)& TSTA_CLRI); // wait for sync of TCLRI write. required because of use of asynchronous clock
  
  NVIC_EnableIRQ(TIMER0_IRQn);
}



/*
* 
* 
*/
void conectionEstablish(void){
  rf_printf("##start##");
  timeMultiplexInit();//initialize timer for periodic interupts
}

/*
* send request for retranmit missing packets
*
*/
char getMissPkt(void)
{
  signed char S;//used as slave pointer
  signed char k = 4;
  signed char l = 0;
  signed char m = 0;
  signed char n = 0;
  signed char str[25];
  signed char str2[2];
  signed char len = 5;
  for (S=0;S<NUM_OF_SLAVE;S++)//iterate trought slaves
    {
      sprintf(str,"S%d P",S);
      l = numOfPkt[actualRxBuffer][S];
      if (S==2)
        LED_ON;
////////check for missing packets////////////////////////////////////
      for(n=0; n<=l ; n++)//iterate throught packets
      {
        len = 5;
        m = pktMemory[S][n][3];//extract number of packet or waiting flag
        if( m == 'w')//check wait flag
        {
          str2[0]= n+'0';
          str2[1]= '\0';
          strcat(str,str2);//append number of missed packet
          len++;
        }
      }
      if (NUM_OF_SLAVE != SID || terminate_flag == 1){//if interrupt occur dont retransmit packet
        terminate_flag=0;
        return -1;
      }
///////////////////send request for retransmitin if needed//////////////
      if (str[4] != '\0')
      {
        rf_printf(str);
        dma_printf(str);
      }
///////////////////wait for packets if needed///////////////////////////
      while(str[k] != '\0')
      {
        if (NUM_OF_SLAVE != SID || terminate_flag==1){//if interrupt occur dont wait for packet
          terminate_flag=0;
          return -1;
        }
//////////receive one packet////////////////////////////////////////////////////////////////////////////////////////////////
        if (RIE_Response == RIE_Success)                                                                                  //
          RIE_Response = RadioRxPacketVariableLen();                                                                      //
        if (RIE_Response == RIE_Success)                                                                                  //
          while (!RadioRxPacketAvailable()){                                                                              //
            if (NUM_OF_SLAVE != SID || terminate_flag==1){//if interrupt occur dont wait for packet packet                //
              RadioTerminateRadioOp();//Terminate any RX or TX operation                                                  //
              terminate_flag=0;                                                                                           //
              return -1;                                                                                                  //
            }                                                                                                             //
          }                                                                                                               //
        if (RIE_Response == RIE_Success)//Read received packet form internal buffer to Buffer                             //
          RIE_Response = RadioRxPacketRead(sizeof(Buffer),&PktLen,Buffer,&RSSI);                                          //
                                                                                                                          //
        strcpy(&pktMemory[(Buffer[1]-'0')][(Buffer[3]-'0')][0],Buffer) ;//copy packet to memory                                          //
        k++;                                                                                                              //
#if THROUGHPUT_MEASURE                                                                                                    //
        rxThroughput = rxThroughput+PktLen;                                                                               //
#endif                                                                                                                    //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        }
      k=4;//reinitialize at first number of packet
    }
      if (RIE_Response == RIE_Success)
      RIE_Response = RadioRxPacketVariableLen(); 
    return 0;//in case of sucses retransmition
}
/*
* flush all received data
*/
void flushBufferedPackets(void){
  
  //switch buffer 
  actualRxBuffer++;
  actualTxBuffer++;
  if(actualTxBuffer==2)
    actualTxBuffer=0;
  else
    actualRxBuffer=0;
  
  dmaTxSlv =0;//initialize
  dmaTxPkt =0;
  flush_flag =1;
  //call DMA_UART_TX_Int_Handler all managment is inside this function
  DMA_UART_TX_Int_Handler ();
}
/*
* functio is waiting and reading 1 data packet
*/
void RadioRecieve(void){

  LED_OFF;
  if (RIE_Response == RIE_Success)
     {
       while (!RadioRxPacketAvailable()){
         if (send == 1){
///////////////////////time slot identificator transmiting////////////////////
           if (SID < NUM_OF_SLAVE){
             rf_printf(TIME_SLOT_ID_MASTER);//start packet for new multiplex
             numOfPkt[actualRxBuffer][SID] = -1;
           }
           else {
             terminate_flag=0;
             getMissPkt();
             flushBufferedPackets();
           }
           send=0;
           if (RIE_Response == RIE_Success)
             RIE_Response = RadioRxPacketVariableLen();//again wait for packet
         }
//////////////////////////////////////////////////////////////////////////////
       }
       LED_ON;
     }
      
  if (RIE_Response == RIE_Success)//Read received packet form internal buffer to Buffer
    RIE_Response = RadioRxPacketRead(sizeof(Buffer),&PktLen,Buffer,&RSSI);
  if (RIE_Response == RIE_Success)
    RIE_Response = RadioRxPacketVariableLen();  
  
#if THROUGHPUT_MEASURE
  rxThroughput = rxThroughput+PktLen;
#endif
  
  //DMA UART stream
#if RX_STREAM 
  DmaChanSetup(UARTTX_C,ENABLE,ENABLE);// Enable DMA channel  
  #if RX_STREAM == 1
  DmaTransferSetup(UARTTX_C,PktLen-1,Buffer);
  #else
  DmaTransferSetup(UARTTX_C,PktLen-8,&Buffer[7]);
  #endif
  UrtDma(0,COMIEN_EDMAT);
#endif
}

/*
*
*/

int main(void)
{ 
  signed char slv,pkt,k,l;
  
  WdtGo(T3CON_ENABLE_DIS);
  
  
  uartInit();
  ledInit();
  radioInit();
  conectionEstablish();
  
  NVIC_SetPriority(DMA_UART_TX_IRQn,7);//terminate DMA TX priority
  NVIC_SetPriority(TIMER1_IRQn,8);//blinking low priority
  NVIC_SetPriority(TIMER0_IRQn,9);//terminate transmiting higher prioritz
  NVIC_SetPriority(EINT8_IRQn,10);//highest priority for radio interupt
  
  while(1)
  {
    RadioRecieve();
    slv=(Buffer[1]-'0');//extracting of slave ID number
    pkt=(Buffer[3]-'0');//extracting of packet number
    
    if (firstRxPkt==0)//if first received packet extract num of packets and chak slave ID
      {
      firstRxPkt=1;
      numOfPkt[actualRxBuffer][slv] = Buffer[5]-'0';//extracting number of expecting TX packets
      k = numOfPkt[actualRxBuffer][slv];
      for (l=0; l<=k ;l++)
        pktMemory[slv][l][3]='w';//write "waiting flag"- ("w") for expected packets
      }
      
      
//     if (slv != SID)//check of slave id (number) expected/transmiting
//       dma_printf("slave id dismatch");
//     if (pkt != nextRxPkt)//check if
//       dma_printf ("missed %d/%d pkt",nextRxPkt,pkt);

    strcpy(&pktMemory[slv][pkt][0],Buffer) ;//copy packet to memory
    nextRxPkt++;
  }
}

///////////////////////////////////////////////////////////////////////////
// GP Timer1 Interrupt handler used for blinking led
///////////////////////////////////////////////////////////////////////////
void GP_Tmr1_Int_Handler (void)
{

  if (GptSta(pADI_TM1)== TSTA_TMOUT) // if timout interrupt
  {
    DioTgl(pADI_GP4,BIT2); // toggle P4.2 

#if THROUGHPUT_MEASURE
    dma_printf("troughputs TX %d bytes/s RX %d bytes/s */*/*/ \n",txThroughput,rxThroughput); 
    txThroughput=0;
    rxThroughput=0;
#endif
  }
}

///////////////////////////////////////////////////////////////////////////
// GP Timer0 Interrupt handler 
// used for transmiting 
///////////////////////////////////////////////////////////////////////////
void GP_Tmr0_Int_Handler(void){
  if (GptSta(pADI_TM0)== TSTA_TMOUT) // if timout interrupt
  {
    nextRxPkt = 0;
    firstRxPkt = 0;
    terminate_flag=1;//more reliable way to terminate operation is via flag
    SID++;//increment Slave ID
    if (SID >= NUM_OF_SLAVE+1)//check Slave ID
      SID =0;
    send = 1;
  }
}

///////////////////////////////////////////////////////////////////////////
// DMA UART TX Interrupt handler 
// used for sending data on UART
// and for terminating of UART stream
///////////////////////////////////////////////////////////////////////////
void DMA_UART_TX_Int_Handler (void)
{
  int len;
  UrtDma(0,0);  // prevents further UART DMA requests
  DmaChanSetup ( UARTTX_C , DISABLE , DISABLE );// Disable DMA channel
  
  if(flush_flag == 1){
    if(dmaTxSlv < NUM_OF_SLAVE){//slave iterate 0..4
      if(dmaTxPkt <= numOfPkt[actualTxBuffer][dmaTxSlv]){//packet itete 0..as needed
        
        dmaTxPtr=&pktMemory[dmaTxSlv][dmaTxPkt][0];//pinter at actuall packet
        
        if(dmaTxPtr[3]!='w'){//try if packet is received
          while(dmaTxPtr[len]!='\0'){//get lenght of packet
            len++;
          }
#if SEND_HEAD
          dmaSend(dmaTxPtr,len);//send data with head
#else
          dmaSend(dmaTxPtr+(HEAD_LENGHT+1),len-(HEAD_LENGHT+1));//send only data without head
#endif
          dmaTx_flag=1;
        }
        else{
          dma_printf("missing packet %d of slave %d ",dmaTxPkt,dmaTxSlv);//message about missing packet
          dmaTx_flag = 1 ;
        }
        dmaTxPkt++;
      }
      else//all packet of actual slave was sended
        dmaTxSlv++;
    }
    else{ //all data sended
      flush_flag=0;
      dmaTx_flag=1;//end of recurent calls
    }
      
    if(dmaTx_flag == 1)
      dmaTx_flag=0;//if some data are sended DMA_UART_TX_Int_Handler is calles after end of transmision
    else
      DMA_UART_TX_Int_Handler();//recurent call while are data sended 
  }
  

    
}
///////////////////////////////////////////////////////////////////////////
// DMA UART RX Interrupt handler 
///////////////////////////////////////////////////////////////////////////
void DMA_UART_RX_Int_Handler   ()
{
  UrtDma(0,0); // prevents additional byte to restart DMA transfer
}
