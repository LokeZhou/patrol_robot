"""autogenerated by genpy from custom_msgs/sensorSample.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import custom_msgs.msg
import geometry_msgs.msg
import std_msgs.msg

class sensorSample(genpy.Message):
  _md5sum = "a9ffa9fd1f9a3708555106a69d2bdf58"
  _type = "custom_msgs/sensorSample"
  _has_header = True #flag to mark the presence of a Header object
  _full_text = """# This is a message to hold data from an IMU (Inertial Measurement Unit)
#
# Accelerations should be in m/s^2 (not in g's), and rotational velocity should be in rad/sec
#
# If the covariance of the measurement is known, it should be filled in (if all you know is the 
# variance of each measurement, e.g. from the datasheet, just put those along the diagonal)
# A covariance matrix of all zeros will be interpreted as "covariance unknown", and to use the
# data a covariance will have to be assumed or gotten from some other source
#
# If you have no estimate for one of the data elements (e.g. your IMU doesn't produce an orientation 
# estimate), please set element 0 of the associated covariance matrix to -1
# If you are interpreting this message, please check for a value of -1 in the first element of each 
# covariance matrix, and disregard the associated estimate.

Header header

Internal internal

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: custom_msgs/Internal
# This is a message to hold data from an IMU (Inertial Measurement Unit)
#
# Accelerations should be in m/s^2 (not in g's), and rotational velocity should be in rad/sec
#
# If the covariance of the measurement is known, it should be filled in (if all you know is the 
# variance of each measurement, e.g. from the datasheet, just put those along the diagonal)
# A covariance matrix of all zeros will be interpreted as "covariance unknown", and to use the
# data a covariance will have to be assumed or gotten from some other source
#
# If you have no estimate for one of the data elements (e.g. your IMU doesn't produce an orientation 
# estimate), please set element 0 of the associated covariance matrix to -1
# If you are interpreting this message, please check for a value of -1 in the first element of each 
# covariance matrix, and disregard the associated estimate.

ImuSensorSample imu

geometry_msgs/Vector3 mag

BaroSensorSample baro

GnssSensorSample gnss


================================================================================
MSG: custom_msgs/ImuSensorSample
# This is a message to hold data from an IMU (Inertial Measurement Unit)
#
# Accelerations should be in m/s^2 (not in g's), and rotational velocity should be in rad/sec
#
# If the covariance of the measurement is known, it should be filled in (if all you know is the 
# variance of each measurement, e.g. from the datasheet, just put those along the diagonal)
# A covariance matrix of all zeros will be interpreted as "covariance unknown", and to use the
# data a covariance will have to be assumed or gotten from some other source
#
# If you have no estimate for one of the data elements (e.g. your IMU doesn't produce an orientation 
# estimate), please set element 0 of the associated covariance matrix to -1
# If you are interpreting this message, please check for a value of -1 in the first element of each 
# covariance matrix, and disregard the associated estimate.

XsensQuaternion dq

geometry_msgs/Vector3 dv

geometry_msgs/Vector3 bGyr




================================================================================
MSG: custom_msgs/XsensQuaternion
# This represents an orientation in free space in quaternion form.

float64 w
float64 x
float64 y
float64 z


================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 

float64 x
float64 y
float64 z
================================================================================
MSG: custom_msgs/BaroSensorSample
# This is a message to hold data from a baro 

float64 height




================================================================================
MSG: custom_msgs/GnssSensorSample
# This is a message to hold data a GNSS unit
# Supported for MTi Devices with FW 1.4 and above.

std_msgs/Float64 itow
std_msgs/Float64 fix

float64 latitude
float64 longitude
float64 hEll
float64 hMsl

# ENU velocity
geometry_msgs/Vector3 vel

float64 hAcc
float64 vAcc
float64 sAcc

float64 pDop
float64 hDop
float64 vDop

float64 numSat
float64 heading
float64 headingAcc




================================================================================
MSG: std_msgs/Float64
float64 data
"""
  __slots__ = ['header','internal']
  _slot_types = ['std_msgs/Header','custom_msgs/Internal']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,internal

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(sensorSample, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.internal is None:
        self.internal = custom_msgs.msg.Internal()
    else:
      self.header = std_msgs.msg.Header()
      self.internal = custom_msgs.msg.Internal()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_struct_3I.pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_struct_32d.pack(_x.internal.imu.dq.w, _x.internal.imu.dq.x, _x.internal.imu.dq.y, _x.internal.imu.dq.z, _x.internal.imu.dv.x, _x.internal.imu.dv.y, _x.internal.imu.dv.z, _x.internal.imu.bGyr.x, _x.internal.imu.bGyr.y, _x.internal.imu.bGyr.z, _x.internal.mag.x, _x.internal.mag.y, _x.internal.mag.z, _x.internal.baro.height, _x.internal.gnss.itow.data, _x.internal.gnss.fix.data, _x.internal.gnss.latitude, _x.internal.gnss.longitude, _x.internal.gnss.hEll, _x.internal.gnss.hMsl, _x.internal.gnss.vel.x, _x.internal.gnss.vel.y, _x.internal.gnss.vel.z, _x.internal.gnss.hAcc, _x.internal.gnss.vAcc, _x.internal.gnss.sAcc, _x.internal.gnss.pDop, _x.internal.gnss.hDop, _x.internal.gnss.vDop, _x.internal.gnss.numSat, _x.internal.gnss.heading, _x.internal.gnss.headingAcc))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.internal is None:
        self.internal = custom_msgs.msg.Internal()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _struct_3I.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 256
      (_x.internal.imu.dq.w, _x.internal.imu.dq.x, _x.internal.imu.dq.y, _x.internal.imu.dq.z, _x.internal.imu.dv.x, _x.internal.imu.dv.y, _x.internal.imu.dv.z, _x.internal.imu.bGyr.x, _x.internal.imu.bGyr.y, _x.internal.imu.bGyr.z, _x.internal.mag.x, _x.internal.mag.y, _x.internal.mag.z, _x.internal.baro.height, _x.internal.gnss.itow.data, _x.internal.gnss.fix.data, _x.internal.gnss.latitude, _x.internal.gnss.longitude, _x.internal.gnss.hEll, _x.internal.gnss.hMsl, _x.internal.gnss.vel.x, _x.internal.gnss.vel.y, _x.internal.gnss.vel.z, _x.internal.gnss.hAcc, _x.internal.gnss.vAcc, _x.internal.gnss.sAcc, _x.internal.gnss.pDop, _x.internal.gnss.hDop, _x.internal.gnss.vDop, _x.internal.gnss.numSat, _x.internal.gnss.heading, _x.internal.gnss.headingAcc,) = _struct_32d.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_struct_3I.pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_struct_32d.pack(_x.internal.imu.dq.w, _x.internal.imu.dq.x, _x.internal.imu.dq.y, _x.internal.imu.dq.z, _x.internal.imu.dv.x, _x.internal.imu.dv.y, _x.internal.imu.dv.z, _x.internal.imu.bGyr.x, _x.internal.imu.bGyr.y, _x.internal.imu.bGyr.z, _x.internal.mag.x, _x.internal.mag.y, _x.internal.mag.z, _x.internal.baro.height, _x.internal.gnss.itow.data, _x.internal.gnss.fix.data, _x.internal.gnss.latitude, _x.internal.gnss.longitude, _x.internal.gnss.hEll, _x.internal.gnss.hMsl, _x.internal.gnss.vel.x, _x.internal.gnss.vel.y, _x.internal.gnss.vel.z, _x.internal.gnss.hAcc, _x.internal.gnss.vAcc, _x.internal.gnss.sAcc, _x.internal.gnss.pDop, _x.internal.gnss.hDop, _x.internal.gnss.vDop, _x.internal.gnss.numSat, _x.internal.gnss.heading, _x.internal.gnss.headingAcc))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.internal is None:
        self.internal = custom_msgs.msg.Internal()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _struct_3I.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 256
      (_x.internal.imu.dq.w, _x.internal.imu.dq.x, _x.internal.imu.dq.y, _x.internal.imu.dq.z, _x.internal.imu.dv.x, _x.internal.imu.dv.y, _x.internal.imu.dv.z, _x.internal.imu.bGyr.x, _x.internal.imu.bGyr.y, _x.internal.imu.bGyr.z, _x.internal.mag.x, _x.internal.mag.y, _x.internal.mag.z, _x.internal.baro.height, _x.internal.gnss.itow.data, _x.internal.gnss.fix.data, _x.internal.gnss.latitude, _x.internal.gnss.longitude, _x.internal.gnss.hEll, _x.internal.gnss.hMsl, _x.internal.gnss.vel.x, _x.internal.gnss.vel.y, _x.internal.gnss.vel.z, _x.internal.gnss.hAcc, _x.internal.gnss.vAcc, _x.internal.gnss.sAcc, _x.internal.gnss.pDop, _x.internal.gnss.hDop, _x.internal.gnss.vDop, _x.internal.gnss.numSat, _x.internal.gnss.heading, _x.internal.gnss.headingAcc,) = _struct_32d.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_3I = struct.Struct("<3I")
_struct_32d = struct.Struct("<32d")
