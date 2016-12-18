#!/usr/bin/env python
import threading
import struct
import rospy
import serial
import binascii
import time
import tf
import math
from math import pi
from ctypes import *
from std_msgs.msg import Int16,Int32,Int64,Float32,Float64,String,UInt64
from patrol_robot.msg import stm_to_pc
from sensor_msgs.msg import Imu
from tf.transformations import euler_from_quaternion
yaw=0;
def update_yaw(Imu):
                global yaw
                yaw=Imu.data
class MyThread(threading.Thread):
	def __init__(self):
		threading.Thread.__init__(self)
       
        def stm_to_pc_unpack(self):
		ser = serial.Serial('/dev/ttyUSB2',115200,timeout=1)
                sub = rospy.Subscriber('yaw',Float64,update_yaw)
                #sub_yaw=rospy.Subscriber('imu_data_str',String,update_yaw)
		pub = rospy.Publisher('stm_to_pc',stm_to_pc,queue_size=1000)
		rospy.init_node('stm_to_pc_unpack')
		r=rospy.Rate(100)
		num_sta = 0
		dataleng = 0
                x=0
                y=0
                x_=0
                y_=0
                x_current=0
                y_current=0
                x_last=0
                y_last=0
                fl_odom=[]
                fr_odom=[]
                bl_odom=[]
                br_odom=[]
                fl_current_odom=0
                fr_current_odom=0
                bl_current_odom=0
                br_current_odom=0
                fl_last_odom=0
                fr_last_odom=0
                bl_last_odom=0
                br_last_odom=0
                fl_start_odom=0
                fr_start_odom=0
                bl_start_odom=0
                br_start_odom=0
                fl_start_flag=0
                fr_start_flag=0
                bl_start_flag=0
                br_start_flag=0
                s1=0
                s2=0
                s3=0
                s4=0
                fl_vel1=[]
                fr_vel2=[]
                bl_vel3=[]
                br_vel4=[]
                vx=0
                vy=0
                vx_=0
                vy_=0
                stm_to_pc_odom=stm_to_pc()              
		while not rospy.is_shutdown():            
			data=ser.read()
			if num_sta==0:
				if data=='O':
					num_sta=1
#                                        print("num_sta=1")
				else:
					num_sta=0
			elif num_sta==1:
				if data=='D':
					num_sta=2
 #                                       print("num_sta=2")
				else:
					num_sta=1
			elif num_sta==2:
                               
				fl_odom.append(data)
                                dataleng=dataleng+1
                                if dataleng==4:
				        num_sta=3
                                        dataleng=0
				        fl_current_odom,=struct.unpack('i',(fl_odom[0]+fl_odom[1]+fl_odom[2]+fl_odom[3]))
                                        if fl_start_flag==0:
                                           fl_start_odom= fl_current_odom
                                           fl_start_flag=1
                                           s1=float(fl_current_odom-fl_start_odom)	
                                        else:
                                           s1=float(fl_current_odom-fl_last_odom) 
                                        fl_last_odom=fl_current_odom
                                        
                                        if s1<-100000:
                                           s1=(2*1000000000+s1)*0.00000974
                                        elif s1>100000:
                                           s1=(-2*1000000000+s1)*0.00000974 
                                        else:
                                           s1=s1*0.00000974
                                        fl_odom=[]
#                                        print fl_current_odom
			elif num_sta==3:                            
			        fr_odom.append(data)
                                dataleng=dataleng+1
                                if dataleng==4:
				        num_sta=4
                                        dataleng=0
				        fr_current_odom,=struct.unpack('i',(fr_odom[0]+fr_odom[1]+fr_odom[2]+fr_odom[3]))
                                        if fr_start_flag==0:
                                           fr_start_odom= fr_current_odom
                                           fr_start_flag=1
                                           s2=float(fr_current_odom-fr_start_odom)
                                        else :
                                           s2=float(fr_current_odom-fr_last_odom)
                                        fr_last_odom=fr_current_odom
 #                                       print s2
                             	        if s2<-100000:
                                           s2=(2*1000000000+s2)*0.00000974
                                        elif s2>100000:
                                           s2=(-2*1000000000+s2)*0.00000974 
                                        else :
                                           s2=s2*0.00000974
                                        fr_odom=[]
                                        
#                                        print fr_current_odom
                        elif num_sta==4:
                        	bl_odom.append(data)
                                dataleng=dataleng+1
                                if dataleng==4:
				        num_sta=5
                                        dataleng=0
				        bl_current_odom,=struct.unpack('i',(bl_odom[0]+bl_odom[1]+bl_odom[2]+bl_odom[3]))
                                        if bl_start_flag==0:
                                           bl_start_odom= bl_current_odom
                                           bl_start_flag=1
                                           s3=float(bl_current_odom-bl_start_odom)
                                        else :
                                           s3=float(bl_current_odom-bl_last_odom)
                                        bl_last_odom=bl_current_odom
	                                if s3<-100000:
                                           s3=(2*1000000000+s3)*0.00000974
                                        elif s3>100000:
                                           s3=(-2*1000000000+s3)*0.00000974 
                                        else :
                                           s3=s3*0.00000974
                                        bl_odom=[]
                                                                      
                        elif num_sta==5:
                        	br_odom.append(data)
                                dataleng=dataleng+1
                                if dataleng==4:
				        num_sta=6
                                        dataleng=0
				        br_current_odom,=struct.unpack('i',(br_odom[0]+br_odom[1]+br_odom[2]+br_odom[3]))
                                        if br_start_flag==0:
                                           br_start_odom= br_current_odom
                                           br_start_flag=1
                                           s4=float(br_current_odom-br_start_odom)
                                        else :
                                           s4=float(br_current_odom-br_last_odom)
                                        br_last_odom=br_current_odom
                            	        if s4<-100000:
                                           s4=(2*1000000000+s4)*0.00000974
                                        elif s4>100000:
                                           s4=(-2*1000000000+s4)*0.00000974 
                                        else :
                                           s4=s4*0.00000974
                                        br_odom=[]
                                       			
                        elif num_sta==6:
                                fl_vel1.append(data)
                                dataleng=dataleng+1
                                if dataleng==4:
                                        num_sta=7
                                        dataleng=0
                                        fl_v1,=struct.unpack('<i',(fl_vel1[0]+fl_vel1[1]+fl_vel1[2]+fl_vel1[3]))
                                        fl_v1=float(fl_v1*0.00000974)			
#                                        print ("fl_v1=",fl_v1)
                                        fl_vel1=[]
                        elif num_sta==7:
                                fr_vel2.append(data)
                                dataleng=dataleng+1
                                if dataleng==4:
                                        num_sta=8
                                        dataleng=0
                                        fr_v2,=struct.unpack('<i',(fr_vel2[0]+fr_vel2[1]+fr_vel2[2]+fr_vel2[3]))
                                        fr_v2=float(fr_v2*0.00000974)				
#                                        print ("fr_v2=",fr_v2)
                                        fr_vel2=[]	
                        elif num_sta==8:
                                bl_vel3.append(data)
                                dataleng=dataleng+1
                                if dataleng==4:
                                        num_sta=9
                                        dataleng=0
                                        bl_v3,=struct.unpack('<i',(bl_vel3[0]+bl_vel3[1]+bl_vel3[2]+bl_vel3[3]))
                                        bl_v3=float(bl_v3*0.00000974)				
#                                        print ("bl_v3=",bl_v3)
                                        bl_vel3=[]
                        elif num_sta==9:
                                br_vel4.append(data)
                                dataleng=dataleng+1
                                if dataleng==4:
                                        num_sta=10
                                        dataleng=0
                                        br_v4,=struct.unpack('<i',(br_vel4[0]+br_vel4[1]+br_vel4[2]+br_vel4[3]))
                                        br_v4=float(br_v4*0.00000974)				
#                                        print ("br_v4=",br_v4)
                                        br_vel4=[]
			elif num_sta==10:
				if data=='O':
                                        num_sta=11
                                else:
					num_sta=10
			elif num_sta==11:
				if data=='M':
                                        num_sta=12
                                else:
					num_sta=11
                        elif num_sta==12:
                                s3=(s3+s2)/2
                                s2=s3
                                s1=(s1+s4)/2
                                x_=(s1+s2)/2
                                y_=(s3-s1)/2
                                if yaw>(pi/2) or yaw <-(pi/2):
                                   x_current=-x_*math.cos(yaw)+y_*math.sin(yaw)
                                   y_current=x_*math.sin(yaw)-y_*math.cos(yaw)
                                else:
                                   x_current=x_*math.cos(yaw)+y_*math.sin(yaw)
                                   y_current=x_*math.sin(yaw)+y_*math.cos(yaw)
                                x=x_last+x_current
                                y=y_last+y_current
                                x_last=x
                                y_last=y
                                stm_to_pc_odom.x=x+0.425
                                stm_to_pc_odom.y=y+0.32
                                fl_v1=(fl_v1+br_v4)/2
                                fr_v2=(fr_v2+bl_v3)/2
                                vx_=(fl_v1+fr_v2)/2
                                vy_=(fr_v2-fl_v1)/2
                                if yaw>(pi/2) or yaw <-(pi/2):
                                   vx=-vx_*math.cos(yaw)+vy_*math.sin(yaw)
                                   vy=vx_*math.sin(yaw)-vy_*math.cos(yaw)
                                else:
                                   vx=vx_*math.cos(yaw)+vy_*math.sin(yaw)
                                   vy=vx_*math.sin(yaw)+vy_*math.cos(yaw)
                                stm_to_pc_odom.vx=vx
                                stm_to_pc_odom.vy=vy
                                pub.publish(stm_to_pc_odom)
#                                print("x=",x)
#                                print("y=",y)
#                                print("vx=",vx)
#                                print("vy=",vy)
                                num_sta=0
                                r.sleep()

                       
						
   
if __name__=='__main__':
	my_thread = MyThread()
	my_thread.start()
	my_thread.stm_to_pc_unpack()
#        stm_to_pc_unpack()
