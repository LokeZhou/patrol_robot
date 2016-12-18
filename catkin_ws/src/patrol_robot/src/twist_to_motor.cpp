#include "ros/ros.h"
#include "std_msgs/Float32.h"
#include "patrol_robot/pc_to_stm.h"


class TwistToMotors
{
public:
	TwistToMotors();
	void spin();
private:
	ros::NodeHandle n;
	
	ros::Publisher pub_lmotor;
	ros::Publisher pub_rmotor;
	ros::Publisher pub_motor;
	//ros::Subscriber cmd_vel_sub;

	float frant_left,frant_right;
	float back_left,back_right;

	float ticks_since_target;
	double timeout_ticks;

	double w;
	double rate;

	float dx,dy,dr;

	void init_variables();

	void spinOnce();
//	void twistCallback(const geometry_msgs::Twist &twist_aux);
};
TwistToMotors::TwistToMotors()
{
	init_variables();
	
	ROS_INFO("Started Twist to Motor node");
	
	//cmd_vel_sub = n.subscribe("cmd_vel",10, &TwistToMotors::twistCallback, this);
	
	//pub_lmotor = n.advertise<std_msgs::Float32>("lwheel_vtarget", 100);

	//pub_rmotor = n.advertise<std_msgs::Float32>("rwheel_vtarget", 100);

    pub_motor = n.advertise<patrol_robot::pc_to_stm>("motor",100);
}

void TwistToMotors::init_variables()
{
	

	dx = dy = dr =0;

	w = 0.28 ;

	rate=100;
	timeout_ticks = 2;
}
void TwistToMotors::spin()
{
	ros::Rate r(rate);
	ros::Rate idle(100);

	ros::Time then = ros::Time::now();
	
	//ticks_since_target = timeout_ticks;

	while (ros::ok())
	{
		while (ros::ok())
		{		
			spinOnce();
			r.sleep();
		}
		ros::spinOnce();
	    idle.sleep();	

	}

}
void TwistToMotors::spinOnce()
{
        static int count;
        count++;
	//turning
//	if(dx == 0)
//	{
//		right = dr * w / 2;
//		left = (-1) * right;
//	}
//	else if (dr == 0)  //forward/backward
//	{
//		left = right = dr;
//	}
//	else   // moving doing arcs
//	{
//		right = ( 1.0 * dx ) + (dr * w /2);
//		left = ( 1.0 * dx ) - (dr * w /2);
//	}
//	ROS_INFO_STREAM("left = " << left << "\t" << "right = " << right);
//临时屏蔽
//	std_msgs::Float32 left_;
//	std_msgs::Float32 right_;
        float vx=0;
        float vy=0;
        float vth=0;
     if(count<=200)
       {
        frant_left=0;
        frant_right=0;
        back_left=0;
        back_right=0;
       }
     if(count>200&&count<=1200)
       { 
        vy=0.1;
        vx=0;
        vth=0;
        frant_left=vx-(vy)+vth*0.55;
        frant_right=vx+(vy)-vth*0.55;
        back_left=vx+(vy)+vth*0.55;
        back_right=vx-(vy)-vth*0.55;
       }
     if(count<=1400&&count>1200)
       {
        frant_left=0;
        frant_right=0;
        back_left=0;
        back_right=0;
       
       }
      if(count<=2400&&count>1400)
       {
        vy=0;
        vx=0.1;
        vth=0;
        frant_left=vx-(vy)+vth*0.55;
        frant_right=vx+(vy)-vth*0.55;
        back_left=vx+(vy)+vth*0.55;
        back_right=vx-(vy)-vth*0.55;
       }
      if(count>2400&&count<=2600)
       {
        frant_left=0;
        frant_right=0;
        back_left=0;
        back_right=0;
       }
       if(count<=3600&&count>2600)
       {
        vy=-0.1;
        vx=0;
        vth=0;
        frant_left=vx-(vy)+vth*0.55;
        frant_right=vx+(vy)-vth*0.55;
        back_left=vx+(vy)+vth*0.55;
        back_right=vx-(vy)-vth*0.55;
       }
       if(count>3600&&count<=3800)
       {
        frant_left=0;
        frant_right=0;
        back_left=0;
        back_right=0;
       }
       if(count<=4800&&count>3800)
       {
        vy=0;
        vx=-0.1;
        vth=0;
        frant_left=vx-(vy)+vth*0.55;
        frant_right=vx+(vy)-vth*0.55;
        back_left=vx+(vy)+vth*0.55;
        back_right=vx-(vy)-vth*0.55;
       }
       if(count>4800)
         {count=0;}
	patrol_robot::pc_to_stm pc_to_stm_velocity;
        pc_to_stm_velocity.on_off=true;
	pc_to_stm_velocity.front_lwheel_target_velocity = frant_left;
	pc_to_stm_velocity.front_rwheel_target_velocity = frant_right;
        pc_to_stm_velocity.back_lwheel_target_velocity = back_left ;
        pc_to_stm_velocity.back_rwheel_target_velocity = back_right;

    pub_motor.publish(pc_to_stm_velocity);
//	pub_lmotor.publish(left_);
//	pub_rmotor.publish(right_);

//	ticks_since_target += 1;

//	ros::spinOnce();
}
/*void TwistToMotors::twistCallback(const geometry_msgs::Twist &msg)
{

	ticks_since_target = 0;
	
	dx = msg.linear.x;
	dy = msg.linear.y;
	dr = msg.angular.z;
//	ROS_INFO_STREAM("dx = " << dx << "\t" << "dy = " << dy <<"\t"<<"dr = "<< dr);
//	ROS_INFO("111111111111111111111111111111111");
}*/
int main(int argc,char **argv)
{
	ros::init(argc,argv,"twist_to_motor");
	TwistToMotors obj;
	
	obj.spin();
}
