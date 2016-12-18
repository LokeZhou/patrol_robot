#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <sensor_msgs/Imu.h>
#include <nav_msgs/Odometry.h>
#include <patrol_robot/stm_to_pc.h>
#include <math.h>
#include<string>
#include"std_msgs/String.h"
#include"std_msgs/Int64.h"
#include"std_msgs/Float64.h"
/********************Goal:subscribe the carVel then send it********************/

class send_odom
{
public:
    send_odom();
    void spin();

private:
    ros::NodeHandle n;
    ros::Subscriber odom_sub,imu_sub;
    ros::Publisher odom_pub,yaw_pub;

    tf::TransformBroadcaster broadcaster;

    double rate;

    double x;
    double y;
 
    double vx;
    double vy;
    
    geometry_msgs::Quaternion  orientation;
    geometry_msgs::Vector3     angular_velocity;

    ros::Time current_time,last_time;

    void odom_callback(const patrol_robot::stm_to_pc::ConstPtr& odom_sub);
    void imu_callback(const sensor_msgs::Imu::ConstPtr& imu_sub);
    void init_variables();

    void update();
};

send_odom::send_odom()
{
    init_variables();

    ROS_INFO("Started odometry computing node");

    //subscribe the topic
    odom_sub = n.subscribe("stm_to_pc",50,&send_odom::odom_callback,this);
    imu_sub=n.subscribe("imu/data",50,&send_odom::imu_callback,this);
    //publish the topic
    odom_pub = n.advertise<nav_msgs::Odometry>("odom",50);
    yaw_pub =n.advertise<std_msgs::Float64>("yaw",50);
}

void send_odom::init_variables()
{
    x = 0.0;
    y = 0.0;
   

    vx = 0.0;
    vy = 0.0;
    

    rate = 50;

    current_time = ros::Time::now();
    last_time = ros::Time::now();
}
void send_odom::odom_callback(const patrol_robot::stm_to_pc::ConstPtr & odom_sub)
{
	// initial position
	x = odom_sub->x;
	y = odom_sub->y;

	// velocity
	vx = odom_sub->vx;
	vy = odom_sub->vy;;
//	ROS_INFO("2222222222222222222222222222");	
}
void send_odom::imu_callback(const sensor_msgs::Imu::ConstPtr & imu_sub)
{
    std_msgs::Float64 yaw;
    double y=0.0;
    orientation=imu_sub->orientation;
    orientation.x=0;
    orientation.y=0;
    angular_velocity=imu_sub->angular_velocity;
   // geometry_msgs::Quaternion &msg_q=orientation;
    y=tf::getYaw(orientation);
  //  ROS_INFO_STREAM("yaw="<<yaw<<"\t");
    yaw.data=y;
    yaw_pub.publish(yaw);
}
//Spin function
void send_odom::spin()
{
    ros::Rate loop_rate(rate);
    while(ros::ok())
    {
        update();
        loop_rate.sleep();
    }
}
//Update function
void send_odom::update()
{
	current_time = ros::Time::now();
       
	// message declarations
	geometry_msgs::TransformStamped odom_trans;
	odom_trans.header.frame_id = "odom";
	odom_trans.child_frame_id = "base_footprint";

	geometry_msgs::Quaternion odom_quat;

	odom_quat = orientation;
	// update transform
	odom_trans.header.stamp = current_time;
	odom_trans.transform.translation.x = x;
	odom_trans.transform.translation.y = y;
	odom_trans.transform.translation.z = 0.0;
	odom_trans.transform.rotation = orientation;
//	ROS_INFO_STREAM("x = " << x << "\t");
	//filling the odometry
	nav_msgs::Odometry odom;
	odom.header.stamp = current_time;
	odom.header.frame_id = "odom";
	odom.child_frame_id = "base_footprint";

	// position
	odom.pose.pose.position.x = x;
	odom.pose.pose.position.y = y;
	odom.pose.pose.position.z = 0.0;
	odom.pose.pose.orientation = odom_quat;

	//velocity
	odom.twist.twist.linear.x = vx;
	odom.twist.twist.linear.y = vy;
	odom.twist.twist.linear.z = 0.0;

	odom.twist.twist.angular.x = 0.0;
	odom.twist.twist.angular.y = 0.0;
	odom.twist.twist.angular.z = angular_velocity.z;

	last_time = current_time;

	// publishing the odometry and the new tf
	broadcaster.sendTransform(odom_trans);
	odom_pub.publish(odom);
	ros::spinOnce();
}

int main(int argc,char **argv)
{
    ros::init(argc,argv,"send_odom");
    send_odom obj;
    obj.spin();
    return 0;
}
