; Auto-generated. Do not edit!


(cl:in-package patrol_robot-msg)


;//! \htmlinclude pc_to_stm.msg.html

(cl:defclass <pc_to_stm> (roslisp-msg-protocol:ros-message)
  ((on_off
    :reader on_off
    :initarg :on_off
    :type cl:boolean
    :initform cl:nil)
   (front_lwheel_target_velocity
    :reader front_lwheel_target_velocity
    :initarg :front_lwheel_target_velocity
    :type cl:float
    :initform 0.0)
   (front_rwheel_target_velocity
    :reader front_rwheel_target_velocity
    :initarg :front_rwheel_target_velocity
    :type cl:float
    :initform 0.0)
   (back_lwheel_target_velocity
    :reader back_lwheel_target_velocity
    :initarg :back_lwheel_target_velocity
    :type cl:float
    :initform 0.0)
   (back_rwheel_target_velocity
    :reader back_rwheel_target_velocity
    :initarg :back_rwheel_target_velocity
    :type cl:float
    :initform 0.0))
)

(cl:defclass pc_to_stm (<pc_to_stm>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <pc_to_stm>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'pc_to_stm)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name patrol_robot-msg:<pc_to_stm> is deprecated: use patrol_robot-msg:pc_to_stm instead.")))

(cl:ensure-generic-function 'on_off-val :lambda-list '(m))
(cl:defmethod on_off-val ((m <pc_to_stm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_robot-msg:on_off-val is deprecated.  Use patrol_robot-msg:on_off instead.")
  (on_off m))

(cl:ensure-generic-function 'front_lwheel_target_velocity-val :lambda-list '(m))
(cl:defmethod front_lwheel_target_velocity-val ((m <pc_to_stm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_robot-msg:front_lwheel_target_velocity-val is deprecated.  Use patrol_robot-msg:front_lwheel_target_velocity instead.")
  (front_lwheel_target_velocity m))

(cl:ensure-generic-function 'front_rwheel_target_velocity-val :lambda-list '(m))
(cl:defmethod front_rwheel_target_velocity-val ((m <pc_to_stm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_robot-msg:front_rwheel_target_velocity-val is deprecated.  Use patrol_robot-msg:front_rwheel_target_velocity instead.")
  (front_rwheel_target_velocity m))

(cl:ensure-generic-function 'back_lwheel_target_velocity-val :lambda-list '(m))
(cl:defmethod back_lwheel_target_velocity-val ((m <pc_to_stm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_robot-msg:back_lwheel_target_velocity-val is deprecated.  Use patrol_robot-msg:back_lwheel_target_velocity instead.")
  (back_lwheel_target_velocity m))

(cl:ensure-generic-function 'back_rwheel_target_velocity-val :lambda-list '(m))
(cl:defmethod back_rwheel_target_velocity-val ((m <pc_to_stm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_robot-msg:back_rwheel_target_velocity-val is deprecated.  Use patrol_robot-msg:back_rwheel_target_velocity instead.")
  (back_rwheel_target_velocity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <pc_to_stm>) ostream)
  "Serializes a message object of type '<pc_to_stm>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'on_off) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'front_lwheel_target_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'front_rwheel_target_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'back_lwheel_target_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'back_rwheel_target_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <pc_to_stm>) istream)
  "Deserializes a message object of type '<pc_to_stm>"
    (cl:setf (cl:slot-value msg 'on_off) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'front_lwheel_target_velocity) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'front_rwheel_target_velocity) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'back_lwheel_target_velocity) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'back_rwheel_target_velocity) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<pc_to_stm>)))
  "Returns string type for a message object of type '<pc_to_stm>"
  "patrol_robot/pc_to_stm")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'pc_to_stm)))
  "Returns string type for a message object of type 'pc_to_stm"
  "patrol_robot/pc_to_stm")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<pc_to_stm>)))
  "Returns md5sum for a message object of type '<pc_to_stm>"
  "f769d436e0706f52db6cef6a616b590e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'pc_to_stm)))
  "Returns md5sum for a message object of type 'pc_to_stm"
  "f769d436e0706f52db6cef6a616b590e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<pc_to_stm>)))
  "Returns full string definition for message of type '<pc_to_stm>"
  (cl:format cl:nil "bool on_off~%float32 front_lwheel_target_velocity~%float32 front_rwheel_target_velocity~%float32 back_lwheel_target_velocity~%float32 back_rwheel_target_velocity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'pc_to_stm)))
  "Returns full string definition for message of type 'pc_to_stm"
  (cl:format cl:nil "bool on_off~%float32 front_lwheel_target_velocity~%float32 front_rwheel_target_velocity~%float32 back_lwheel_target_velocity~%float32 back_rwheel_target_velocity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <pc_to_stm>))
  (cl:+ 0
     1
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <pc_to_stm>))
  "Converts a ROS message object to a list"
  (cl:list 'pc_to_stm
    (cl:cons ':on_off (on_off msg))
    (cl:cons ':front_lwheel_target_velocity (front_lwheel_target_velocity msg))
    (cl:cons ':front_rwheel_target_velocity (front_rwheel_target_velocity msg))
    (cl:cons ':back_lwheel_target_velocity (back_lwheel_target_velocity msg))
    (cl:cons ':back_rwheel_target_velocity (back_rwheel_target_velocity msg))
))
