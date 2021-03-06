// Generated by gencpp from file patrol_robot/stm_to_pc.msg
// DO NOT EDIT!


#ifndef PATROL_ROBOT_MESSAGE_STM_TO_PC_H
#define PATROL_ROBOT_MESSAGE_STM_TO_PC_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace patrol_robot
{
template <class ContainerAllocator>
struct stm_to_pc_
{
  typedef stm_to_pc_<ContainerAllocator> Type;

  stm_to_pc_()
    : x(0.0)
    , y(0.0)
    , vx(0.0)
    , vy(0.0)  {
    }
  stm_to_pc_(const ContainerAllocator& _alloc)
    : x(0.0)
    , y(0.0)
    , vx(0.0)
    , vy(0.0)  {
    }



   typedef float _x_type;
  _x_type x;

   typedef float _y_type;
  _y_type y;

   typedef float _vx_type;
  _vx_type vx;

   typedef float _vy_type;
  _vy_type vy;




  typedef boost::shared_ptr< ::patrol_robot::stm_to_pc_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::patrol_robot::stm_to_pc_<ContainerAllocator> const> ConstPtr;

}; // struct stm_to_pc_

typedef ::patrol_robot::stm_to_pc_<std::allocator<void> > stm_to_pc;

typedef boost::shared_ptr< ::patrol_robot::stm_to_pc > stm_to_pcPtr;
typedef boost::shared_ptr< ::patrol_robot::stm_to_pc const> stm_to_pcConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::patrol_robot::stm_to_pc_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::patrol_robot::stm_to_pc_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace patrol_robot

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'patrol_robot': ['/home/exbot/catkin_ws/src/patrol_robot/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::patrol_robot::stm_to_pc_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::patrol_robot::stm_to_pc_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::patrol_robot::stm_to_pc_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::patrol_robot::stm_to_pc_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::patrol_robot::stm_to_pc_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::patrol_robot::stm_to_pc_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::patrol_robot::stm_to_pc_<ContainerAllocator> >
{
  static const char* value()
  {
    return "2af08925b9da4c99c24669eae33385e8";
  }

  static const char* value(const ::patrol_robot::stm_to_pc_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x2af08925b9da4c99ULL;
  static const uint64_t static_value2 = 0xc24669eae33385e8ULL;
};

template<class ContainerAllocator>
struct DataType< ::patrol_robot::stm_to_pc_<ContainerAllocator> >
{
  static const char* value()
  {
    return "patrol_robot/stm_to_pc";
  }

  static const char* value(const ::patrol_robot::stm_to_pc_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::patrol_robot::stm_to_pc_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
float32 x\n\
float32 y\n\
float32 vx\n\
float32 vy\n\
";
  }

  static const char* value(const ::patrol_robot::stm_to_pc_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::patrol_robot::stm_to_pc_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.vx);
      stream.next(m.vy);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct stm_to_pc_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::patrol_robot::stm_to_pc_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::patrol_robot::stm_to_pc_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<float>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<float>::stream(s, indent + "  ", v.y);
    s << indent << "vx: ";
    Printer<float>::stream(s, indent + "  ", v.vx);
    s << indent << "vy: ";
    Printer<float>::stream(s, indent + "  ", v.vy);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PATROL_ROBOT_MESSAGE_STM_TO_PC_H
