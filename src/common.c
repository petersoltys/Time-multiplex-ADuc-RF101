// #include "common.h"
// // extern unsigned char  Buffer[255];
// // extern RIE_U8         PktLen;
// // extern RIE_S8         RSSI;
// // extern RIE_Responses  RIE_Response;
// /*
// * inicializovanie portu na ktorom je pripojena user specified led
// */
// void ledInit(void){
// 	  // P4.2  as output
//   DioCfg(pADI_GP4,0x10);
//   DioOen(pADI_GP4, BIT2); 
// }
// /*
// * function for initialise the Radio
// * funkcia na inicialiyovanie radioveho prenosu
// */
// void radioInit(void){
//   // Initialise the Radio
//   if (RIE_Response == RIE_Success)
//      //RIE_Response = RadioInit(DR_38_4kbps_Dev20kHz);  
//      RIE_Response = RadioInit(DR_300_0kbps_Dev75_0kHz);  
//   // Set the Frequency to operate at 915 MHz
//   if (RIE_Response == RIE_Success)
//      RIE_Response = RadioSetFrequency(433920000);//433.92 Mhz (Bakalarka Oto Petura)
//   // Set the PA and Power Level
//   if (RIE_Response == RIE_Success)
//      RIE_Response = RadioTxSetPA(DifferentialPA,PowerLevel15);
//   //set data whitening
//   if (RIE_Response == RIE_Success)
//      RIE_Response = RadioPayldDataWhitening(RIE_TRUE);
// }
// /*
// *
// *
// */
// #include <stdarg.h>
// #if DMA_PRINTF
// int dma_printf(const char * format /*format*/, ...)
// {
//     char buff[256];
// 	  unsigned char len;
//     va_list args;
//     va_start( args, format );
//        
//     len =vsprintf(buff, format,args);//vlozenie formatovaneho retazca do buff
//     //DMA UART stream
//     
//     DmaChanSetup(UARTTX_C,ENABLE,ENABLE);// Enable DMA channel  
//     DmaTransferSetup(UARTTX_C,len,buff);
//     UrtDma(0,COMIEN_EDMAT);
//     

//   va_end( args );
//   return len;
// }
// #endif
// /*
// *
// *
// */
// void radioSend(char* buff, char len){
//   if (RIE_Response == RIE_Success)  
//     while(!RadioTxPacketComplete());
//   
//   if (RIE_Response == RIE_Success){
//     RIE_Response = RadioTxPacketVariableLen(len, buff); 
//   }
// }

// /*
// * this function is equivalent to function printf from librarz stdio.h
// * but output stream is throught radio transmitter
// * before call this function is nessesary to initialize radio
// * any one formated string (call) is sended in one packet
// */

// unsigned char rf_printf(const char * format /*format*/, ...){
//   char buff[256];
//   unsigned char len;
//   va_list args;
//   va_start( args, format );

//   len=vsprintf(buff, format,args);//vlozenie formatovaneho retazca do buff
//   if(len>255){//kontrola maximalnej dlzky retazca
//     va_end( args );
//     return 0;
//   }
//       
//   radioSend(buff,len+1);
//   
// #if THROUGHPUT_MEASURE
//   txThroughput=txThroughput+len;
// #endif
//   //DMA UART stream
// #if TX_STREAM
//   DmaChanSetup(UARTTX_C,ENABLE,ENABLE);// Enable DMA channel  
//   DmaTransferSetup(UARTTX_C,len-1,buff);
//   UrtDma(0,COMIEN_EDMAT);
// #endif

//   va_end( args );
//   return len;
// }
