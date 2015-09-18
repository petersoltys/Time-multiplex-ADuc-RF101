// /**
//  *****************************************************************************
//    @example  I2CmasterUART.c
//    @brief    I2C is configured in master mode.
//              - SCL on P1.4 (mode 1)
//              - SDA on P1.5 (mode 1)

//              For use with I2CslaveEEPROM.c and i2cserial.exe 

//    @version  V0.1
//    @author   PAD CSE group
//    @date     December 2012 

//    
// All files for ADuCRF101 provided by ADI, including this file, are
// provided  as is without warranty of any kind, either expressed or implied.
// The user assumes any and all risk from the use of this code.
// It is the responsibility of the person integrating this code into an application
// to ensure that the resulting application performs as required and is safe.

// **/

// #include "include.h"

// // Bit Definitions
// #define I2C_RD_BIT 0x1

// // Function Definitions
// void Uart_Packet_Handler( volatile unsigned int value, volatile unsigned char Byte_Number);
// unsigned char I2CWritePacket( unsigned int length);
// unsigned char I2CReadPacket( unsigned int length);


// // Application specific variables
// volatile unsigned char ucMsgType = 0; 		// Indicates I2CSerial.exe application requested I2C read or write
// volatile unsigned short ucLength = 0;  		// Indicates I2CSerial.exe "number of bytes" for I2C read or write
// volatile unsigned int ucStartAddress = 0;	// Indicates I2CSerial.exe "Start address" for I2C read or write
// volatile unsigned char chipAddress = 0; 	// Indicates I2CSerial.exe "device address" I2C read or write
// volatile unsigned short ucDataCnt = 0; 		// Message Parser counter for UART messages

// volatile unsigned char ucValidUARTPacket = 0;   // Indicates a valid UART packet has been received.
// volatile unsigned short ucSendI2CPacket = 0;	// Used in main loop to indicate I2C message is ready for transmission

// volatile unsigned char rxDat[256];	  		// 256 byte buffer-array for I2C receive data
// volatile unsigned short ucRxCount = 0; 			// rxDat array control variable.
// volatile unsigned short ucComRx;   			// Variable used to read UART Rx buffer contents into 

// volatile unsigned char ucTransfer[256];	        // Buffer used during I2C "writes to Slave"	
// volatile unsigned int ucRdCnt = 0;	 	// Counter for UART receive messages

// volatile unsigned char ucTxBufferEmpty = 0;	// Indicates UART Tx buffer empty
// volatile unsigned char ucTransmitInProgress =0; // Indicates I2C Tx FIFO ready for data
// volatile unsigned char ucReceiveInProgress = 0; // Indicates I2C Rx sequence with the SLave is complete
// volatile unsigned char ucI2CWrCnt = 0; 		// Counter for controlling I2C writes


// int main(void)
// {
//   WdtGo(T3CON_ENABLE_DIS);   
//   DioCfg(pADI_GP1, 0x509);     // Configures P1.4 and P1.5 for I2C, P1.0 and P1.1 for UART
//   //DioPul(pADI_GP1, 0x4F);
//   
//   UrtLinCfg(0, 19200, COMLCR_WLS_8BITS, COMLCR_PEN_DIS);
//   UrtIntCfg(0, COMIEN_ERBFI|COMIEN_ETBEI); // enable Rx and Tx interrupts
//   NVIC_EnableIRQ(UART_IRQn);
// 	
//   // Enable I2C Master mode, baud rate and interrupt sources
//   I2cMCfg(I2CMCON_TXDMA_DIS|I2CMCON_RXDMA_DIS, I2CMCON_IENCMP|I2CMCON_IENNACK|I2CMCON_IENALOST|I2CMCON_IENRX|I2CMCON_IENTX, I2CMCON_MAS_EN); 
//   I2cBaud(0x4E,0x4F); // 100kHz clock
//   //I2cBaud(0x12,0x13); // 400kHz clock
//   NVIC_EnableIRQ(I2CM_IRQn);
//  
//   while (1)
//   {	
//     if (ucSendI2CPacket == 1)
//     {
//       if (ucMsgType == 0)
//         I2CWritePacket(ucLength);
//       else
//         I2CReadPacket(ucLength);
//       ucSendI2CPacket = 0;
//       ucDataCnt = 0;
//       ucRdCnt = 0;
//     }	
//   }
// }

// // This Function Parses the UART packets received from the PC application.
// void Uart_Packet_Handler( volatile unsigned int value, volatile unsigned char Byte_Number)
// {
//   switch(Byte_Number)
//   {
//   case 1: //Read/Write indicator
//     {
//       ucMsgType = value;
//       break;
//     } 
//   case 2:  //Length of data in packet
//     {
//       ucLength = value;
//       if (ucLength == 0)
//         ucLength = 256;
//       break;
//     }	   
//   case 3:  //Length of data in packet second byte
//     {
//       ucLength = (value<<8);
//       break;
//     }	 
//   case 6: // Memory Start Address
//     {
//       ucStartAddress = value;
//       break;
//     }
//   case 7: // Chip  Address
//     {
//       chipAddress = value;
//       break;
//     }
//   case 9: // Memory Start Address
//     {
//       if (ucMsgType == 1)	        // if msg type is a read - reset buffer
//       {
//         ucDataCnt = 0;			// Reset message parse register
//         ucSendI2CPacket = 1;  	        // Send read command to the slave
//         ucRdCnt = 0;
//         ucValidUARTPacket = 0;
//       }
//       break;
//     }
//   default :
//     break;
//   }
// }

// // This function Starts an I2C Write sequence
// unsigned char I2CWritePacket(unsigned int length )
// {
//   ucTransmitInProgress = 1;
//   I2cFifoFlush(MASTER, ENABLE);
//   I2cFifoFlush(MASTER, DISABLE);
//   I2cMWrCfg(chipAddress);	// set I2C address	 (LSB = 0, Master Write)
//   I2cTx(MASTER, ucStartAddress);
//   ucI2CWrCnt = 0;
//   while (ucTransmitInProgress == 1){}
//   return 1;
// }

// // Fucntion used to commence I2C Read sequence
// unsigned char I2CReadPacket( unsigned int length)
// {
//   unsigned short n = 0;
//   unsigned short ucBytesToRD = 0;	// Stores number of bytes to be read from Slave via I2C

//   ucTransmitInProgress = 1; // Transmit
//   I2cFifoFlush(MASTER, ENABLE);
//   I2cFifoFlush(MASTER, DISABLE);
//   NVIC_DisableIRQ(I2CM_IRQn);
//   I2cMWrCfg(chipAddress);
//   I2cTx(MASTER, ucStartAddress);
//   while ((I2cSta(MASTER)& I2CMSTA_TXFSTA_MSK) != 0x0){}
//   I2cMRdCfg(chipAddress, ucLength , DISABLE);           // Repeated Start Condition
//   ucBytesToRD = ucLength;
//   ucLength = 0;
//   
//   NVIC_EnableIRQ(I2CM_IRQn);
//   ucReceiveInProgress = 1;

//   while (ucReceiveInProgress == 1) {}
// 	 
//   I2cFifoFlush(MASTER, ENABLE);
//   I2cFifoFlush(MASTER, DISABLE);
//   ucDataCnt = 0;
//   ucRdCnt = 0;
//   ucTxBufferEmpty = 0;
//   UrtTx(0, rxDat[0]);
//   ucSendI2CPacket = 0;
//   for (n = 1; n < ucBytesToRD; n++)
//   {
//     while (ucTxBufferEmpty != 1){}
//     ucTxBufferEmpty = 0;
//     UrtTx(0, rxDat[n]);
//   }
//   return 1;
// }


// ///////////////////////////////////////////////////////////////////////////
// // I2C0 master handler 
// ///////////////////////////////////////////////////////////////////////////
// void I2C0_Master_Int_Handler(void) 
// {
//   unsigned int uiI2CMSTATUS; 
//   uiI2CMSTATUS = I2cSta(MASTER);
//   
//   if((uiI2CMSTATUS & I2CMSTA_TXREQ) == I2CMSTA_TXREQ)  // Master Transmit IRQ	
//   {											    
//     if (ucI2CWrCnt < ucLength)
//       I2cTx(MASTER, ucTransfer[ucI2CWrCnt++]);
//     else 
//     {
//       ucTransmitInProgress = 0;		
//       ucRxCount = 0; 	
//     }
//   }	
//   	
//   if((uiI2CMSTATUS & I2CMSTA_RXREQ) == I2CMSTA_RXREQ) // Master Receive IRQ
//   {
//     rxDat[ucRxCount++] = I2cRx(MASTER);  
//     if((ucRxCount == I2cMRdCnt())|(ucRxCount == 1))
//       ucReceiveInProgress = 0;	
//   }
// }

// ///////////////////////////////////////////////////////////////////////////
// // UART handler 
// ///////////////////////////////////////////////////////////////////////////
// void UART_Int_Handler ()
// {	
//   unsigned char ucCOMIID0; 
//   ucCOMIID0 = UrtIntSta(0);		// Read UART Interrupt ID register 

//   if ((ucCOMIID0 & COMIIR_STA_TXBUFEMPTY) == COMIIR_STA_TXBUFEMPTY)	  // Transmit buffer empty interrupt
//     ucTxBufferEmpty = 1;
//   if ((ucCOMIID0 & COMIIR_STA_RXBUFFULL) == COMIIR_STA_RXBUFFULL)	  // Receive buffer full interrupt
//   {
//     ucComRx = UrtRx(0);
//     if ((ucRdCnt == 0) && (ucComRx == 8)) 	        // Received Start character 0x08
//       ucValidUARTPacket = 1;
//     if ((ucRdCnt < 10) && (ucSendI2CPacket == 0) && (ucValidUARTPacket == 1))
//     {					
//       Uart_Packet_Handler( ucComRx, ucRdCnt);
//       ucRdCnt++;
//     }
//     else if ((ucSendI2CPacket == 0) && (ucValidUARTPacket == 1))
//     {
//       ucTransfer[ucDataCnt++] = UrtRx(0);	
//       if (ucDataCnt == ucLength)
//       {
//         ucDataCnt = 0;					// Reset message parse register
//         ucSendI2CPacket = 1;  			        // Send Packet to the slave
//         ucValidUARTPacket = 0;
//       }
//     }
//   }
// }


/**
 *****************************************************************************
   @example  transmit.c
   @brief    Demonstrate the use of the Radio Inteface Engine to transmit
             a fixed or variable length packet. 
             For use with receive.c

             Note that VAR_LENGTH must have the same value in transmit.c and receive.c

   @version  V0.2
   @author   Peter Soltys
   @date     July 2015  

   @par Revision History:
   - V0.1, July 2015  : initial version.     

All files for ADuCRF101 provided by ADI, including this file, are
provided  as is without warranty of any kind, either expressed or implied.
The user assumes any and all risk from the use of this code.
It is the responsibility of the person integrating this code into an application
to ensure that the resulting application performs as required and is safe.

**/
#include "include.h"

#define VAR_LENGTH 1
#define NUM_OF_SLAVE 4 //number of slave devices

RIE_Responses RIE_Response = RIE_Success;
unsigned char  Buffer[255];
RIE_U8         PktLen;
RIE_S8         RSSI;

int i,j;
char buff[256];
unsigned char SID;//Slave ID
char send;

void Delay(void)
{
   volatile int iDelay = 0x1FFFF;

   while (iDelay--);
}
/*
*inicializovanie uart portu
* rychlost 19200 baud
* 8 bitov
* jeden stop bit
* vystup port P1.0\P1.1
*/
void uartInit(void){
	UrtLinCfg(0,57600,COMLCR_WLS_8BITS,COMLCR_STOP_DIS);
  DioCfg(pADI_GP1,0x9); // UART functionality on P1.0\P1.1
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
     RIE_Response = RadioInit(DR_300_0kbps_Dev75_0kHz);      
  // Set the Frequency to operate at 915 MHz
  if (RIE_Response == RIE_Success)
     RIE_Response = RadioSetFrequency(915000000);
  // Set the PA and Power Level
  if (RIE_Response == RIE_Success)
     RIE_Response = RadioTxSetPA(DifferentialPA,PowerLevel15);
}
	
/*
* this function is equivalent to function printf from librarz stdio.h
* but output stream is throught radio transmitter
* before call this function is nessesary to initialize radio
* any one formated string (call) is sended in one packet
*/
#include <stdarg.h>
void rf_printf(const char * format /*format*/, ...){
	  unsigned char len;
    va_list args;
    va_start( args, format );

		len=vsprintf(buff, format,args);//vlozenie formatovaneho retazca do buff
    printf("\n%s",buff);
	  if(len>255){//kontrola maximalnej dlzky retazca
      va_end( args );
      return ;
    }
    
			if (RIE_Response == RIE_Success)
				RIE_Response = RadioTxPacketVariableLen(len+1, buff);  
    if (RIE_Response == RIE_Success)  
      while(!RadioTxPacketComplete());

  va_end( args );
}
/***************************************************************************************************
****************************************************************************************************
***************************************************************************************************/
void timeMultiplexInit(){
  GptLd (pADI_TM0, 1030); // Interval of 10ms
  GptCfg(pADI_TM0, TCON_CLK_UCLK, TCON_PRE_DIV256, TCON_ENABLE|TCON_MOD_PERIODIC);
  while (GptSta(pADI_TM0)& TSTA_CON); // wait for sync of TCON write. required because of use of asynchronous clock
  GptClrInt(pADI_TM0,TCLRI_TMOUT);
  while (GptSta(pADI_TM0)& TSTA_CLRI); // wait for sync of TCLRI write. required because of use of asynchronous clock
  
  NVIC_EnableIRQ(TIMER0_IRQn);
}





void conectionEstablish(void){
  rf_printf("##start##");
  timeMultiplexInit();
}






void RadioRecieve(void){//pocka na prijatie jedneho paketu
	if (RIE_Response == RIE_Success)
      RIE_Response = RadioRxPacketVariableLen();  
	if (RIE_Response == RIE_Success)
		 {
       while (!RadioRxPacketAvailable()){
         if (send == 1){
           RadioTerminateRadioOp();//Terminate anz RX or TX operation
           rf_printf("Slave %d Time Slot",SID);//start packet for new multiplex
           send=0;
         }
       }
		 }
		 
	if (RIE_Response == RIE_Success)
		RIE_Response = RadioRxPacketRead(sizeof(Buffer),
																		&PktLen,
																		Buffer,
																		&RSSI);
}




int main(void)
{ 
     
  WdtGo(T3CON_ENABLE_DIS);
	
	
	uartInit();
	ledInit();
	radioInit();
  conectionEstablish();
	blink(1);//blink in 1s interval
  i=0;
  NVIC_SetPriority(EINT8_IRQn,2);//higher prioritz for radio interupt
  printf("priorita %d",NVIC_GetPriority(EINT8_IRQn));
  
	while(1)
  {    
    RadioRecieve();
    printf("Slave %d data:%s",SID,Buffer);
  }
	
	
	blinkDisable();
  while (1)
  {
  }
}

///////////////////////////////////////////////////////////////////////////
// GP Timer1 Interrupt handler used for blinking led
///////////////////////////////////////////////////////////////////////////
void GP_Tmr1_Int_Handler (void)
{
  if (GptSta(pADI_TM1)== TSTA_TMOUT) // if timout interrupt
  {
    GptClrInt(pADI_TM1,TCLRI_TMOUT);
    DioTgl(pADI_GP4,BIT2); // toggle P4.2 
    i=0;
    while (GptSta(pADI_TM1)& TSTA_CLRI); // wait for sync of TCLRI write. required because of use of asynchronous clock
  }
}

///////////////////////////////////////////////////////////////////////////
// GP Timer0 Interrupt handler 
// used for transmiting 
///////////////////////////////////////////////////////////////////////////
void GP_Tmr0_Int_Handler(void){
  if (GptSta(pADI_TM0)== TSTA_TMOUT) // if timout interrupt
  {
    printf("pkt %d",i++);
    RadioTerminateRadioOp();//Terminate anz RX or TX operation
    SID++;
    if (SID >= NUM_OF_SLAVE)
      SID =0;
    send = 1;
  }
  GptClrInt(pADI_TM0,TCLRI_TMOUT);
  while (GptSta(pADI_TM0)& TSTA_CLRI); // wait for sync of TCLRI write. required because of use of asynchronous clock
}
