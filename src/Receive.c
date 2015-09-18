/**
 *****************************************************************************
   @example  receive.c
   @brief    receive data packets and write content of packet on SD card 
	           and send via uart with RSSI
						  
             Note that VAR_LENGTH must have the same value in transmit.c and receive.c 

   @version  V1.0 initialization
   @author   Peter Soltys
   @date     July 2015   

   @par Revision History:
   - V1.0, July 2015  : initial version. 

All files for ADuCRF101 provided by ADI, including this file, are
provided  as is without warranty of any kind, either expressed or implied.
The user assumes any and all risk from the use of this code.
It is the responsibility of the person integrating this code into an application
to ensure that the resulting application performs as required and is safe.

**/
#include "include.h"
#include "SD_SPI/ff.h"

#define VAR_LENGTH 1

unsigned char  Buffer[255];
RIE_U8         PktLen;
RIE_S8         RSSI;

RIE_Responses RIE_Response = RIE_Success;

FATFS FatFs;
FIL fil;       /* File object */
FRESULT fr;    /* FatFs return code */

int i,j;

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
void uart_init(void){
	UrtLinCfg(0,19200,COMLCR_WLS_8BITS,COMLCR_STOP_DIS);
  DioCfg(pADI_GP1,0x9); // UART functionality on P1.0\P1.1
}
/*
* inicializovanie portu na ktorom je pripojena user specified led
*/
void led_init(void){
	  // P4.2  as output
  DioCfg(pADI_GP4,0x10);
  DioOen(pADI_GP4, BIT2); 
}
/*
* function for initialise the Radio
*/
void Radio_init(void){
	  // Initialise the Radio
  if (RIE_Response == RIE_Success)
     RIE_Response = RadioInit(DR_38_4kbps_Dev20kHz);      
  // Set the Frequency to operate at 915 MHz
  if (RIE_Response == RIE_Success)
     RIE_Response = RadioSetFrequency(915000000);
}
/*
* function receive one packet from radio
*/
void Radio_recieve(void){//pocka na prijatie jedneho paketu
	  if (RIE_Response == RIE_Success)
  {
    if (VAR_LENGTH) 
      RIE_Response = RadioRxPacketVariableLen();   
    else  
      RIE_Response = RadioRxPacketFixedLen(12);
     //printf("waiting for a packet\n");
  }
	if (RIE_Response == RIE_Success)
		 {
		 while (!RadioRxPacketAvailable());
		 }
		 
	if (RIE_Response == RIE_Success)
		RIE_Response = RadioRxPacketRead(sizeof(Buffer),
																		&PktLen,
																		Buffer,
																		&RSSI);
}
/*
* parameter str [out] return name of text file
* example "signal.txt"
*/
void get_txt_name(char * str){
	int len=3;
	
	while(1){
	Radio_recieve();//cakanie na prijatie nazvu suboru

	if (RIE_Response == RIE_Success)
		{
			if(Buffer[0]=='#'){
				if(Buffer[1]=='@'){
					if(Buffer[2]=='#'){
						while(Buffer[len]!='\0'){
							str[len-3]=Buffer[len];
							len++;
						}
						break;
					}
				}
			}
		}
	}
 }
/*
* inicializovanie karty vytvorenie textoveho suboru signal.txt
* s nalogovanymi hodnotamy urovni signalu meranych pri prime
*/
void SD_init(void){
	char str[30];
	fr=f_mount(&FatFs, "", 0);//inicializacia SD karty
	printf("inicializujem kartu");
	if(fr)printf("chyba pri inicializacii karty (alebo SPI) %d \n",fr);
	
	//vytvorenie textoveho suboru
	get_txt_name(str);//pocka na prijatie paketu s nazvom suboru
	fr = f_open(&fil, str , FA_WRITE|FA_CREATE_ALWAYS);
	printf("vytvaram subor %s",str);
	if(fr)printf("chyba pri vytvarani suboru %d \n",fr);
	
	Radio_recieve();//cakanie na prijatie hlavicky suboru
	fr = f_printf(&fil,"%s",Buffer);//hlavicka v txt subore

}


int main(void)
{   
  WdtGo(T3CON_ENABLE_DIS);//stop watch-dog

	uart_init();
	led_init();
	
	Radio_init();//inicializuje radio prenos
	SD_init();//nacita kartu a vytvori subor prijaty cez radio prenos
	

  for(i=0;i<29;i++){

		Radio_recieve();//pocka na prijatie jedneho paketu

		if (RIE_Response == RIE_Success)
		{
			 printf("\n\r-> %s \n@ RSSI %d ",Buffer,(int)RSSI);
			 fr = f_printf(&fil,"\n\r-> %s \n@ RSSI %d \n",Buffer,(int)RSSI);
		}
		else
		{
			 printf("\n\r-> ERROR");
			 fr = f_printf(&fil,"\n\r-> ERROR");
		}
	}
	
	RIE_Response = RadioTerminateRadioOp();
	
	fr=f_close(&fil);//koiec zapisu na kartu
	printf("\nzatvaram\n");
  if(fr)printf("chyba pri zatvarani suboru %d\n",fr);
	
  while (1)//ukonceny zapis
     {
     DioTgl(pADI_GP4,BIT2);
     Delay();
     }



}


