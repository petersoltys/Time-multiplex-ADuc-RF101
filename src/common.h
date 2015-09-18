#include <include.h>
//#include "common.c"
//#include "master.c"



#define RX_STREAM 0 //stream of redeived data to UART
#define TX_STREAM 0 //stream of transmited data to UART
#define DMA_PRINTF 1 //define DMA printf function
#define THROUGHPUT_MEASURE 0 //measure and print message about troughput on uart



// extern unsigned char  Buffer[255];
// extern RIE_U8         PktLen;
// extern RIE_S8         RSSI;
// extern RIE_Responses  RIE_Response;

// extern void ledInit(void);
// extern void radioInit(void);
// #if DMA_PRINTF
// extern int dma_printf(const char * format /*format*/, ...);
// #endif
// extern void radioSend(char* buff, char len);
// extern unsigned char rf_printf(const char * format /*format*/, ...);
