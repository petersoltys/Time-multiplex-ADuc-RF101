# Time-multiplex-ADuc-RF101
Program using time multiplex for transmiting data from optionaly number of Slaves to Maseter device via RF-channel with checking data integrity using hardware implement CRC and retransmiting missing data.
Debuged for ADucRF101MKxZ

Author:   Peter Šoltýs
Version:  0.3
Hardware: ADucRF101MKxZ
Date:     16.9.2015
Project:  Time-multiplex-ADuc-RF101

Compatible with program  UWB - Coordinate Reader Deployment from Peter Mikula
https://github.com/Gresthorn/UWB_COORDINATE_READER

Function description:

Master device transmiting time slot identificator for any slave (one packet any 0,01s)

transmit scheme :

|-0-|-1-|-2-|..num of slaves|-re-tx-|...
---> time

in detail:        

|-0-...
|(slave time slot identificator),["packet head",user data],["packet head",user data],...
---> time

|-re-tx-...
|(retransmiting identificator with numbers of missing packets),["packet head",packet data],["packet head",packet data],...
---> time

legend:	

()Master data    
[]Slave data

  
Packet head format: (in case of 4 slaves)

S(slave number 0..3)P(number of packet 0..N)/(number of buffered packets  0..N)"spacebar"(data)

printf version:  "S%dP%d/%d ",slave_number,actual_packet,number_of_buffered_packets


re-tx packet format: (one packet for one slave)

S(slave number 0..3) P(number of missing packet 0..N)(number of next missing packet 0..N)...

buffering and posibly retransmiting are data only from last time slot


