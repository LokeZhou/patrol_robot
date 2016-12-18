#!/usr/bin/env python

import struct
import rospy
import serial
import time
import math

from patrol_robot.msg import pc_to_stm,hand_to_stm
from ctypes import *
from std_msgs.msg import Int16,Int32,Int64,Float32,String,UInt64
unlocking = 0
front_left_wheel_speed_=0
front_right_wheel_speed_=0
back_left_wheel_speed_=0
back_right_wheel_speed_=0
hand_front_left_wheel_speed_=0
hand_front_right_wheel_speed_=0
hand_back_left_wheel_speed_=0
hand_back_right_wheel_speed_=0
start_flag=0
on_off=0
hand_on_off=0
def Update_Speed(pc_to_stm):
	global unlocking 
        global on_off
	global front_left_wheel_speed_
	global front_right_wheel_speed_
        global back_left_wheel_speed_
        global back_right_wheel_speed_
        if(pc_to_stm.on_off==True):
                        on_off=1
	                front_left_wheel_speed_=int(pc_to_stm.front_lwheel_target_velocity*1000)
	                front_right_wheel_speed_=int(pc_to_stm.front_rwheel_target_velocity*1000)
                        back_left_wheel_speed_= int(pc_to_stm.back_lwheel_target_velocity*1000)
                        back_right_wheel_speed_=int(pc_to_stm.back_rwheel_target_velocity*1000)
def Update_Hand_buff(hand_to_stm):
        global hand_front_left_wheel_speed_
	global hand_front_right_wheel_speed_
        global hand_back_left_wheel_speed_
        global hand_back_right_wheel_speed_
        global hand_on_off
        if(hand_to_stm.left_on_off==True):
                        hand_on_off=1
	                hand_front_left_wheel_speed_=int(hand_to_stm.front_lwheel_target_velocity*1000)
	                hand_front_right_wheel_speed_=int(hand_to_stm.front_rwheel_target_velocity*1000)
                        hand_back_left_wheel_speed_= int(hand_to_stm.back_lwheel_target_velocity*1000)
                        hand_back_right_wheel_speed_=int(hand_to_stm.back_rwheel_target_velocity*1000)
        else:
                        hand_on_off=0
def listener():
	ser = serial.Serial('/dev/ttyUSB2',115200,timeout=1)
	motor_speed = rospy.Subscriber('motor',pc_to_stm,Update_Speed)
        hand_buff=rospy.Subscriber('hand_buff',hand_to_stm,Update_Hand_buff)
	global unlocking
        global start_flag
        global hand_on_off
	rospy.init_node('listener',anonymous=True)
	r=rospy.Rate(100)
	while not rospy.is_shutdown():
                        if(start_flag==0):
                                 ser.write('S')
			         ser.write('T')
                                 start_flag=1
                        if(on_off==1 and hand_on_off==0):
			         ser.write('A')
			         ser.write('C')
			         ser.write(struct.pack('<h',front_left_wheel_speed_))
			         ser.write(struct.pack('<h',front_right_wheel_speed_))
                                 ser.write(struct.pack('<h',back_left_wheel_speed_))
                                 ser.write(struct.pack('<h',back_right_wheel_speed_))
 #                                print ("on_off=" , on_off)
 #                                print("front_left_wheel_speed_=",front_left_wheel_speed_)
 #                                print("front_right_wheel_speed_=",front_right_wheel_speed_)
 #                                print("back_left_wheel_speed_=",back_left_wheel_speed_)
#                                 print("back_right_wheel_speed_=",back_right_wheel_speed_)
		        if(hand_on_off==1):
                                 ser.write('H')
			         ser.write('B')
#                                 print("front_left_wheel_speed_=",hand_front_left_wheel_speed_)
#                                 print("front_right_wheel_speed_=",hand_front_right_wheel_speed_)
#                                 print("back_left_wheel_speed_=",hand_back_left_wheel_speed_)
#                                 print("back_right_wheel_speed_=",hand_back_right_wheel_speed_)
			         ser.write(struct.pack('<h',hand_front_left_wheel_speed_))
			         ser.write(struct.pack('<h',hand_front_right_wheel_speed_))
                                 ser.write(struct.pack('<h',hand_back_left_wheel_speed_))
                                 ser.write(struct.pack('<h',hand_back_right_wheel_speed_))
#                                 print ("hand_on_off=",hand_on_off)
                                 
		        r.sleep()
if __name__=='__main__':
		listener()

