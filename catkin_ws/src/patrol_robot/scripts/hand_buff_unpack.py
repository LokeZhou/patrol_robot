#!/usr/bin/env python

import threading
import struct
import rospy
import serial
import binascii
import time
from math import pi

from ctypes import *
from std_msgs.msg import Int16,Int32,Int64,Float32,Float64,String,UInt64
from patrol_robot.msg import hand_to_stm
class MyThread(threading.Thread):
	def __init__(self):
		threading.Thread.__init__(self)

        def hand_buff_unpack(self):
		ser = serial.Serial('/dev/ttyUSB1',19200,timeout=1)
		pub = rospy.Publisher('hand_buff',  hand_to_stm,queue_size=1000)
		rospy.init_node('hand_buff_unpack')
		r=rospy.Rate(100)
		num_sta = 0
		dataleng = 0
                switch_mode=0
                stop=0
                vx=0
                vy=0
                vth=0
                dx=0
                dy=0
                dvth=0
                temp=0
		hand_buff = hand_to_stm()
                hand_buff.back=False
                hand_buff.link1=False
                hand_buff.link2=False
                hand_buff.link3=False
                hand_buff.link4=False
                hand_buff.left_on_off=False
                hand_buff.right_on_off=False
 #               print "hand_buff start!"
		while not rospy.is_shutdown():
			data=ser.read()
#                        print data
			if num_sta==0:
				if data=='U':
					num_sta=1
 #                                       print("num_sta=1")
				else:
					num_sta=0
			elif num_sta==1:
				if data=='\xaa':
					num_sta=2
#                                        print("num_sta=2")
				else:
					num_sta=0
			elif num_sta==2:
                                velocity_vx=[]
				velocity_vx.append(data)
				num_sta=3
				vx,=struct.unpack('B',(velocity_vx[0]))
				vx=float(vx)
                                dvx=(vx-50)/200
                                if(dvx>=-0.05 and dvx<=0.05):
                                                           dvx=0
#                                dvx=-dvx	
#			        print("vx=",vx)
 #                               print("dvx=",dvx)		
			elif num_sta==3:
                                velocity_vy=[]
				velocity_vy.append(data)
				num_sta=4
				vy,=struct.unpack('B',(velocity_vy[0]))
				vy=float(vy)
                                dvy=(vy-50)/200	
                                if(dvy>=-0.05 and dvy<=0.05):
                                                           dvy=0	
#				print("vy=",vy)
 #                               print("dvy=",dvy)
			elif num_sta==4:
                                velocity_vth=[]
				velocity_vth.append(data)
			        num_sta=5
				vth,=struct.unpack('B',(velocity_vth[0]))
				vth=float(vth)
                                dvth=((vth-50)/2000)*180/pi
                                if(dvth>=-0.5 and dvth<=0.5):
                                                           dvth=0
 #                               dvth=0	
                                dvth=-dvth
#				print("vth=",vth)
#                                print("dvth=",dvth)
			elif num_sta==5:
                                hand_temp=[]
				hand_temp.append(data)
				num_sta=6
				temp,=struct.unpack('B',( hand_temp[0]))
                                if(temp==126):
                                        hand_buff.back=True       
                                if(temp==125):
                                        hand_buff.link1=True 
                                        stop=stop+1;     
                                if(temp==123):
                                        hand_buff.link2=True   
                                if(temp==119):
                                        hand_buff.link3=True
                                if(temp==111):
                                        hand_buff.link4=True
                                if(temp==95):
                                        hand_buff.right_on_off=True
                                if(temp==63):
                                        hand_buff.left_on_off=True
#				print("temp=",temp)			
			elif num_sta==6:
				if data=='\x0d':
                                        num_sta=7
                                else:
					num_sta=6
			elif num_sta==7:
				if data=='\x0a':
                                        num_sta=8
                                else:
					num_sta=7
                        elif num_sta==8:
 #                               if(hand_buff.link1==True):
 #                                       if(stop==2):
 #                                                         hand_buff.link1=False
 #                                                         stop=0
 #                                       else:
 #                                                         hand_buff.front_lwheel_target_velocity=0
 #                                                         hand_buff.front_rwheel_target_velocity=0
 #                                                         hand_buff.back_lwheel_target_velocity=0
 #                                                         hand_buff.back_rwheel_target_velocity=0
                                
 #                               else:
                                        hand_buff.front_lwheel_target_velocity=(dvy-dvx+dvth*0.55)
                                        hand_buff.front_rwheel_target_velocity=(dvy+dvx-dvth*0.55)
                                        hand_buff.back_lwheel_target_velocity=(dvy+dvx+dvth*0.55)
                                        hand_buff.back_rwheel_target_velocity=(dvy-dvx-dvth*0.55)
                                        if(hand_buff.front_lwheel_target_velocity>0.5):
                                                          hand_buff.front_lwheel_target_velocity=0.5
                                        if(hand_buff.front_lwheel_target_velocity<-0.5):
                                                          hand_buff.front_lwheel_target_velocity=-0.5
                                        if(hand_buff.front_rwheel_target_velocity>0.5):
                                                          hand_buff.front_rwheel_target_velocity=0.5
                                        if(hand_buff.front_rwheel_target_velocity<-0.5):
                                                          hand_buff.front_rwheel_target_velocity=-0.5
                                        if(hand_buff.back_lwheel_target_velocity>0.5):
                                                          hand_buff.back_lwheel_target_velocity=0.5
                                        if(hand_buff.back_lwheel_target_velocity<-0.5):
                                                          hand_buff.back_lwheel_target_velocity=-0.5
                                        if(hand_buff.back_rwheel_target_velocity>0.5):
                                                          hand_buff.back_rwheel_target_velocity=0.5
                                        if(hand_buff.back_rwheel_target_velocity<-0.5):
                                                          hand_buff.back_rwheel_target_velocity=-0.5
 #                               print("stop",stop)
                                        pub.publish(hand_buff)
                                        hand_buff.left_on_off=False
                                        num_sta=0
			                r.sleep()	
   
if __name__=='__main__':
	my_thread = MyThread()
	my_thread.start()
	my_thread.hand_buff_unpack()
#        hand_buff_unpack()
        
