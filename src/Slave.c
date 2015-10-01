/**
 *****************************************************************************
   @example  Slave.c
   @brief    prigram used for transmiting data in time multiplex
             data are received via UART and sended trouhgt radio interface
             during associated time slot 
             working with Master.c
             tested on ADucRF101MKxZ

             

   @version  V1.3
   @author   Peter Soltys
   @date     august 2015  

   @par Revision History:
   - V1.0, July 2015  : initial version. 
   - V1.1, august 2015  : fully  functional.  (only shyntetic data transmitted)
   - V1.2, august 2015  : fully  functional.  (transmiting received data via UART (only fixed lenght packet))
   - V1.3, september 2015  : faster version with higher throughput and transmiting variable lenght packets 
                             working with "UWB - Coordinate Reader Deployment" from Peter Mikula


note : in radioeng.c was changed intial value from
    static RIE_BOOL             bPacketTx                     = RIE_FALSE; 
    static RIE_BOOL             bPacketRx                     = RIE_FALSE; 
to 
    static RIE_BOOL             bPacketTx                     = RIE_TRUE; 
    static RIE_BOOL             bPacketRx                     = RIE_TRUE; 

**/
#include "include.h"
#include "SD_SPI/ff.h"
#include "settings.h"

#define LED_OFF DioSet(pADI_GP4,BIT2)//led off
#define LED_ON  DioClr(pADI_GP4,BIT2)//led on


RIE_Responses RIE_Response = RIE_Success;
unsigned char  Buffer[255];
RIE_U8         PktLen;
RIE_S8         RSSI;

// [level][num of packet][packet data]
char pktMemory[3][10][255];
/*
  pktMemory is 3 levels deep 
  puspose is changing in circle 
  0 actual receiving buffer
  1 actual sending buffer
  2 actual buffer for retransmit
  for pointing are used flags : actualRxBuffer, actualTxBuffer, actualReTxBuffer
*/
char actualRxBuffer=0;
char actualTxBuffer=1;
char actualReTxBuffer=2;
char numOfPackets[3] = {0,0,0};//similar like pktMemory
char rxBuffer[255];
char* rxPktPtr ;
int rxCount = 0;
/////////flags/////////////////////
char TX_flag=0,RX_flag=0,terminate_flag=0;
char my_time_slot = 0;

int i=0,j=0;
int debugTimer=0;

#if THROUGHPUT_MEASURE
int txThroughput;
int rxThroughput;
#endif

/*
* initializing uart port
* speed UART_BAUD_RATE_SLAVE baud
* 8 bits
* one stop bit
* output port P1.0\P1.1
*/
void uart_init(void){
  rxPktPtr =&pktMemory[actualRxBuffer][numOfPackets[actualRxBuffer]][HEAD_LENGHT+1];//pinting beyound packet head
  
	UrtLinCfg(0,UART_BAUD_RATE_SLAVE,COMLCR_WLS_8BITS,COMLCR_STOP_DIS);//configure uart
  DioCfg(pADI_GP1,0x9); // UART functionality on P1.0\P1.1
  
#if LEN_OF_RX_PKT == 0
  UrtIntCfg(0,COMIEN_ERBFI);// enable Rx interrupts
  NVIC_EnableIRQ(UART_IRQn);// setup to receive data using interrupts
#endif
  
  DmaInit();// Create DMA descriptor
 // Set transfer parameters
 //                 transfer  target
 //                 channel   count pointer
  DmaTransferSetup(UARTTX_C,  20,   Buffer);
  DmaTransferSetup(UARTRX_C,  20,   rxPktPtr);
  NVIC_EnableIRQ ( DMA_UART_TX_IRQn );// Enable DMA UART TX interrupt
  NVIC_EnableIRQ ( DMA_UART_RX_IRQn );// Enable DMA UART RX interrupt
  
#if LEN_OF_RX_PKT
//enable RX DMA chanel for receiving packets forom UART
  DmaChanSetup(UARTRX_C,ENABLE,ENABLE);// Enable DMA channel  
  DmaTransferSetup(UARTRX_C,LEN_OF_RX_PKT,rxPktPtr);
  UrtDma(0,COMIEN_EDMAR);//start rx 
#endif
}
/*
* initializing port with led
* inicializovanie portu na ktorom je pripojena user specified led
*/
void led_init(void){
	  // P4.2  as output
  DioCfg(pADI_GP4,0x10);
  DioOen(pADI_GP4, BIT2); 
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
* send one packet using radio channel
*
*/
void radioSend(char* buff, char len){
  if (RIE_Response == RIE_Success)  
    while(!RadioTxPacketComplete());
  
  if (RIE_Response == RIE_Success){
    RIE_Response = RadioTxPacketVariableLen(len, buff); 
  }
  
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
* function receive one packet from radio
*/
void Radio_recieve(void){//pocka na prijatie jedneho paketu
  
	  if (RIE_Response == RIE_Success)
  {
      RIE_Response = RadioRxPacketVariableLen();   
      terminate_flag = 0 ;
  }
	if (RIE_Response == RIE_Success)
		 {
		 while (!RadioRxPacketAvailable() && terminate_flag==0)
      {
      debugTimer++;
      if (debugTimer > 900000)//turn on led if nothing is received (master stop working)
        LED_ON;
      }
      debugTimer=0;
		 }

	if (RIE_Response == RIE_Success)
		RIE_Response = RadioRxPacketRead(sizeof(Buffer),
																		&PktLen,
																		Buffer,
																		&RSSI);
#if THROUGHPUT_MEASURE
  rxThroughput=rxThroughput+PktLen;
#endif
  //DMA UART stream
#if RX_STREAM
  DmaChanSetup(UARTTX_C,ENABLE,DISABLE);// Enable DMA channel  
  DmaTransferSetup(UARTTX_C,PktLen-1,Buffer);
  UrtDma(0,COMIEN_EDMAT);
#endif
}

/*
* function set timer for interval 10ms aproximetly 
* less than time of master, remaining time is used to transmit last packet
* after timeout is generated interupt, witch mark interupt_flag to terminate 
* transmit operation
*/
void setTimeToTx(void){
  GptLd (pADI_TM0, 1150); // Interval of 10ms
  GptCfg(pADI_TM0, TCON_CLK_UCLK, TCON_PRE_DIV256, TCON_ENABLE_EN|TCON_RLD_EN|TCON_MOD_PERIODIC);
  while (GptSta(pADI_TM0)& TSTA_CON); // wait for sync of TCON write. required because of use of asynchronous clock
  GptClrInt(pADI_TM0,TCLRI_TMOUT);
  while (GptSta(pADI_TM0)& TSTA_CLRI); // wait for sync of TCLRI write. required because of use of asynchronous clock
  NVIC_EnableIRQ(TIMER0_IRQn);
}

/*
* function waiting for restart of master
*/
void conectionEstablish(void){
  do
    Radio_recieve();
  while (strcmp(Buffer,"##start##"));//wait for start packet
}

#if THROUGHPUT_MEASURE == 2
/*
* function sending false data packets, only for measuring purpose
*/
transmitShynteticData(){
  setTimeToTx();
  my_time_slot=1;
  
  while(my_time_slot==1)
    rf_printf("S%dP0/2 my shyntetic data ... number of tx data %d Bytes",SLAVE_ID,txThroughput);
}
#else

/*
* function is transmiting all prepared packets throught radio link
* all data packets are received via UART
*/
char transmit(void){
  char* pktMemoryPtr;
  char txPkt=0;
  setTimeToTx();
  my_time_slot=1;

  //change buffer pointers
  actualRxBuffer++;
  actualTxBuffer++;
  actualReTxBuffer++;
  if(actualRxBuffer>=3)
    actualRxBuffer=0;
  else if(actualTxBuffer>=3)
    actualTxBuffer=0;
  else if(actualReTxBuffer>=3)
    actualReTxBuffer=0;
  
  numOfPackets[actualRxBuffer]=0;
  
  while (my_time_slot == 1 && (txPkt < numOfPackets[actualTxBuffer]) ){     //while interupt ocurs send avaliable packets
    pktMemoryPtr = &pktMemory[actualTxBuffer][txPkt][0];

    sprintf(pktMemoryPtr,HEAD_FORMAT);//build head of packet
    pktMemoryPtr[HEAD_LENGHT]=' ';//replace '\0' with ' ' spacebar because '\0' is also end of packet indicator
    

    if (terminate_flag != 1){
      rf_printf(pktMemoryPtr);//send packet
    }
    else{
      terminate_flag = 0;
      return txPkt;//return number of transmited packets
    }
    txPkt++;
  }
  return txPkt;//return number of transmited packets
}
#endif

/*
* function retransmit missing packets
* @return : number of retransmited packets
*/
char retransmit(void){
  char pkt = 4;
  char reTxPkt[20];
  setTimeToTx();
  my_time_slot=1;
  strcpy(reTxPkt,Buffer);
  while ((reTxPkt[pkt]!='\0') && my_time_slot==1 && terminate_flag == 0)//retransmit only until interupt occur
  {
    rf_printf(&pktMemory[actualReTxBuffer][(reTxPkt[pkt]-'0')][0]);
    pkt++;
  }
  return (pkt-4);
}

#if THROUGHPUT_MEASURE
/*
* function set timer for 1s timeout
* only for measuring purpose
*/
void troughputMeasureInit(void){
  GptLd (pADI_TM1, 0x0); // Interval of 1s
  GptCfg(pADI_TM1, TCON_CLK_LFOSC, TCON_PRE_DIV32768, TCON_ENABLE|TCON_MOD_PERIODIC);
  while (GptSta(pADI_TM1)& TSTA_CON); // wait for sync of TCON write. required because of use of asynchronous clock
  GptClrInt(pADI_TM1,TCLRI_TMOUT);
  while (GptSta(pADI_TM1)& TSTA_CLRI); // wait for sync of TCLRI write. required because of use of asynchronous clock
  NVIC_EnableIRQ(TIMER1_IRQn);
}
#endif

/*
*
*/
int main(void)
{   
  WdtGo(T3CON_ENABLE_DIS);//stop watch-dog

  NVIC_SetPriority(UART_IRQn,5);//receiving of packets if not constant lenght of packet
  NVIC_SetPriority(DMA_UART_RX_IRQn,6);//terminate DMA RX priority
  NVIC_SetPriority(DMA_UART_TX_IRQn,7);//terminate DMA TX priority
	NVIC_SetPriority(TIMER1_IRQn,9);//blinking low priority
  NVIC_SetPriority(TIMER0_IRQn,8);//terminate transmiting higher prioritz
  NVIC_SetPriority(EINT8_IRQn,4);//highest priority for radio interupt
  
  //initialize all interfaces
	uart_init();
	led_init();
#if THROUGHPUT_MEASURE
  troughputMeasureInit();
#endif
	Radio_init();//inicialize ratio conection
  conectionEstablish();
  
  while (1){
    do{
      Radio_recieve();
      if (0 == memcmp(Buffer,RETRANSMITION_ID,4))
      {
        LED_ON;
        TX_flag=1;
        retransmit();
        TX_flag=0;
        LED_OFF;
      }
    }
    while ( 0 != strcmp(Buffer,TIME_SLOT_ID_SLAVE));
    
#if THROUGHPUT_MEASURE == 2
      LED_ON;
      TX_flag=1;
      transmitShynteticData();//only for measuring
      TX_flag=0;
      LED_OFF;
#else

    if(numOfPackets[actualRxBuffer])//if is something to send
      {
      LED_ON;
      TX_flag=1;
      transmit();
      TX_flag=0;
      LED_OFF;
      }
#endif
    }
}
///////////////////////////////////////////////////////////////////////////
// GP Timer0 Interrupt handler 
// used for end of transmiting 
///////////////////////////////////////////////////////////////////////////
void GP_Tmr0_Int_Handler(void){
  if (GptSta(pADI_TM0)== TSTA_TMOUT) // if timout interrupt
  {   
    terminate_flag=1;    
    my_time_slot=0;  
  }
  GptCfg(pADI_TM0, TCON_CLK_UCLK, TCON_PRE_DIV256, TCON_ENABLE_DIS);//stop timer
  while (GptSta(pADI_TM0)& TSTA_CON); // wait for sync of TCON write. required because of use of asynchronous clock
}
///////////////////////////////////////////////////////////////////////////
// GP Timer1 Interrupt handler 
// used for measure trouthput any 1s
///////////////////////////////////////////////////////////////////////////
void GP_Tmr1_Int_Handler(void){
  if (GptSta(pADI_TM1)== TSTA_TMOUT) // if timout interrupt
  { 
#if THROUGHPUT_MEASURE
    dma_printf("troughputs TX %d bytes/s RX %d bytes/s */*/*/ \n",txThroughput,rxThroughput); 
    txThroughput=0;
    rxThroughput=0;
#endif
  }
}

///////////////////////////////////////////////////////////////////////////
// UART DMA Interrupt handler for transmit
// used for ending of DMA operation
///////////////////////////////////////////////////////////////////////////
void DMA_UART_TX_Int_Handler ()
{
  UrtDma(0,COMIEN_EDMAR);  // prevents further UART DMA requests
// Disable DMA channel
  DmaChanSetup ( UARTTX_C , DISABLE , DISABLE );
}
///////////////////////////////////////////////////////////////////////////
// DMA UART Interrupt handler 
// used for build packet
///////////////////////////////////////////////////////////////////////////
void DMA_UART_RX_Int_Handler   ()
{
#if LEN_OF_RX_PKT

  numOfPackets[actualRxBuffer]++;
  if(numOfPackets[actualRxBuffer]>9)//if is buffered more than 10 packets
    numOfPackets[actualRxBuffer]=0;
  
  rxPktPtr = &pktMemory[actualRxBuffer][numOfPackets[actualRxBuffer]][HEAD_LENGHT+1];//pinting beyound packet head
  
  UrtDma(0,COMIEN_EDMAT); // prevents additional byte to restart DMA transfer
  
  //enable RX DMA chanel for receiving next packets forom UART
  DmaChanSetup(UARTRX_C,ENABLE,ENABLE);// Enable DMA channel  
  DmaTransferSetup(UARTRX_C,LEN_OF_RX_PKT,rxPktPtr);
  UrtDma(0,COMIEN_EDMAR);

#endif
}
///////////////////////////////////////////////////////////////////////////
// Hard Fault Interrupt handler 
// if pointer going out of array
///////////////////////////////////////////////////////////////////////////
HardFault_Handler(){
  LED_OFF;
}
///////////////////////////////////////////////////////////////////////////
// UART Interrupt handler 
// used for spliting data to packets
// function is taken from example UARTLoopback.c and modified
///////////////////////////////////////////////////////////////////////////
void UART_Int_Handler ()
{ 	
#if LEN_OF_RX_PKT==0
  unsigned char ucLineSta, ucCOMIID0; 
  char ch;
 
  ucCOMIID0 = UrtIntSta(0);		// Read UART Interrupt ID register

  if ((ucCOMIID0 & COMIIR_STA_RXBUFFULL) == COMIIR_STA_RXBUFFULL)	  // Receive buffer full interrupt
  {
    ch	= UrtRx(0);   //call UrtRd() clears COMIIR_STA_RXBUFFULL
  
    rxBuffer[rxCount]= ch;
    rxCount++;
    
    if (ch == '$'){//end of packet pointer
      rxBuffer[rxCount]= '\0';//write end of string
      rxPktPtr = &pktMemory[actualRxBuffer][numOfPackets[actualRxBuffer]][HEAD_LENGHT+1];//pinting beyound packet head
      strcpy(rxPktPtr,rxBuffer);
      numOfPackets[actualRxBuffer]++;
      rxCount=0;
    }
    if(numOfPackets[actualRxBuffer]>9){//if is buffered more than 10 packets
      numOfPackets[actualRxBuffer]=0;
      dma_printf("buffer full ");
    }
  }
#endif
} 