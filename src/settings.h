/**
 *****************************************************************************
   @example  settings.h
   @brief    configurating file defining base settings


   @version  V1.3
   @author   Peter Soltys
   @date     september 2015  


note : in radioeng.c was changed intial value from
    static RIE_BOOL             bPacketTx                     = RIE_FALSE; 
    static RIE_BOOL             bPacketRx                     = RIE_FALSE; 
to 
    static RIE_BOOL             bPacketTx                     = RIE_TRUE; 
    static RIE_BOOL             bPacketRx                     = RIE_TRUE; 

**/

/*
* Radio configuration macros
*/

#define RADIO_CFG         DR_300_0kbps_Dev75_0kHz
//      - DR_1_0kbps_Dev10_0kHz  Base configuration of 1 kbps datarate, 10.0 kHz frequency deviation.
//      - DR_38_4kbps_Dev20kHz  Base configuration of 38.4 kbps datarate, 20 kHz frequency deviation.
//      - DR_300_0kbps_Dev75_0kHz  Base configuration of 300 kbps datarate, 75 kHz frequency deviation.

#define RADIO_MODULATION GFSK_Modulation
// Transmitter Modulation Type. Can be FSK_Modulation or GFSK_Modulation.

#define RADIO_FREQENCY     433920000//**433.92 Mhz |EU}(Bakalarka Oto Petura)
//      - This must be within the available bands of the radio: 
//      - 431000000Hz to 464000000Hz and 
//      - 862000000Hz to 928000000Hz.

#define PA_TYPE DifferentialPA
//        {DifferentialPA, SingleEndedPA} Select Single Ended or Differential PA Type

#define RADIO_POWER        PowerLevel15
//        {PowerLevel0 ,PowerLevel1 ,PowerLevel2 ,PowerLevel3,
//         PowerLevel4 ,PowerLevel5 ,PowerLevel6 ,PowerLevel7,
//         PowerLevel8 ,PowerLevel9 ,PowerLevel10,PowerLevel11,
//         PowerLevel12,PowerLevel13,PowerLevel14,PowerLevel15} 

#define DATA_WHITENING     RIE_TRUE
//         Data whitening can be employed to avoid long runs of 1s or 0s
//         in the transmitted data stream. 

//         This ensures sufficient bit transitions in the packet, which 
//         aids in receiver clock and data recovery because the encoding 
//         breaks up long runs of 1s or 0s in the transmit packet. 

//         The data, excluding the preamble and sync word, is automatically
//         whitened before transmission by XORing the data with an 8-bit 
//         pseudorandom sequence. 

//         At the receiver, the data is XORed with the same pseudorandom 
//         sequence, thereby reversing the whitening. 

//         The linear feedback shift register polynomial used is x7 + x1 + 1.

#define RADIO_MANCHASTER     RIE_FALSE
//         Enable or Disable Manchester Encoding of payload data.

//         Manchester encoding can be used to ensure a dc-free (zero mean) 
//         transmission. 

//         A Binary 0 is mapped to 10, and a Binary 1 is mapped to 01. 

//         Manchester encoding and decoding are applied to the payload data 
//         and the CRC. 



/*
* Master interface settings
*/
#define NUM_OF_SLAVE 4 //number of slave devices
#define UART_BAUD_RATE_MASTER 128000

#define TIME_SLOT_ID_MASTER "Slave %d Time Slot",SID



/*
* Slave interface settings
* 
*/

//Baudrate is ste to 9600 because of compatibility with 
//"UWB - Coordinate Reader Deployment" from Peter Mikula
#define UART_BAUD_RATE_SLAVE 9600

//slave identificating macros
#define TIME_SLOT_ID_SLAVE "Slave 2 Time Slot"//number in string is Slave == 0..3 number
#define RETRANSMITION_ID "S2 P"//number in string is Slave == 0..3 number
#define SLAVE_ID 2 //Slave == 0..3 number
#define LEN_OF_RX_PKT 0 //lenght of received packets from UART (if==0 variable lenght)

//head definition
#define HEAD_LENGHT 6
#define HEAD_FORMAT "S%dP%d/%d",SLAVE_ID,txPkt,numOfPackets[actualTxBuffer]-1 //format inside of sprintf


/*
* debug macros
*/
#define RX_STREAM 0 //stream of redeived data to UART
#define TX_STREAM 0 //stream of transmited data to UART
#define SEND_HEAD 1 //send also heads of packets on UART

#define THROUGHPUT_MEASURE 0  //if ==0 no measuring
                              //if ==1 measure throughput of received data from UART
                              //if ==2 measure maximum throughput with shyntetic data
                              //measured are all data included packet heads (aproximetlz 5000 Bytes/s by slave)
                              
                              