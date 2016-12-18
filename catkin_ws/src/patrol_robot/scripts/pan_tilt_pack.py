#!/usr/bin/env python

import struct
import rospy
import serial
import time
import binascii

def listener():
	ser_rx = serial.Serial('/dev/ttyUSB0',9600,timeout=1)
        ser_tx = serial.Serial('/dev/ttyUSB1',9600,timeout=1)
        rospy.init_node('pan_tilt_pack',anonymous=True)
	r=rospy.Rate(100)
        num_sta = 0
        dataleng = 0
        vx=[]
        vy=[]
        x=0
        y=0
        high_bit8=0
        low_bit8=0
        add=0
        cmd_x=0
	while not rospy.is_shutdown():
                        data=ser_rx.read()
                        if num_sta==0:
				if data=='\xff':
					num_sta=1
#                                        ser_tx.write("\xff")
                                       # print("num_sta=1")
				else:
					num_sta=0
                        elif num_sta==1:
                                if data=='\x01':
					num_sta=2
#                                        ser_tx.write("\x01")
                                       # print("num_sta=2")
				else:
					num_sta=1
                        elif num_sta==2:
                                if data=='\x00':
					num_sta=3
#                                        ser_tx.write("\x00")
                                       # print("num_sta=3")
				else:
					num_sta=2
                        elif num_sta==3:
                                if data=='\x4b':
					num_sta=4
#                                        ser_tx.write("\x4b")
                                       # print("num_sta=4")
				elif data=='\x4d':
					num_sta=14
                                        #ser_tx.write("\x4d")
#                                        print("num_sta=14")
                                else:
                                        num_sta=0
                        elif num_sta==4:
                                vx.append(data)
                                dataleng=dataleng+1
                                if dataleng==2:
                                        num_sta=0
                                        dataleng=0
                                        x,=struct.unpack('>H',vx[0]+vx[1])
                                        if x>18000:
                                            x=54000-x
                                        else:
                                            x=18000-x
                                        print x
                                        high_bit8=(x & 0xff00)
                                        high_bit8=(high_bit8>>8)
                                        low_bit8=(x & 0x00ff)
                                        add=76+high_bit8+low_bit8
                                        add=(add & 0x00ff)
                                        print hex(high_bit8)
                                        print hex(low_bit8)
                                        print hex(add)
                                        vx=[]
                                        cmd_x=chr(255)+chr(1)+chr(0)+chr(75)+chr(high_bit8)+chr(low_bit8)+chr(add)
                                        cmd_x=binascii.b2a_hex(cmd_x)
                                        cmd_x=cmd_x.decode("hex")
#                                        print cmd_x
                                        ser_tx.write(cmd_x)

                                        
                        elif num_sta==14:
                                vy.append(data)
                                dataleng=dataleng+1
                                if dataleng==2:
                                        num_sta=0
                                        dataleng=0
                                        y,=struct.unpack('H',vy[0]+vy[1])           
                       
                    
		        #r.sleep()
if __name__=='__main__':
		listener()

