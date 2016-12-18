; Auto-generated. Do not edit!


(cl:in-package patrol_robot-msg)


;//! \htmlinclude hand_to_stm.msg.html

(cl:defclass <hand_to_stm> (roslisp-msg-protocol:ros-message)
  ((left_on_off
    :reader left_on_off
    :initarg :left_on_off
    :type cl:boolean
    :initform cl:nil)
   (right_on_off
    :reader right_on_off
    :initarg :right_on_off
    :type cl:boolean
    :initform cl:nil)
   (back
    :reader back
    :initarg :back
    :type cl:boolean
    :initform cl:nil)
   (link1
    :reader link1
    :initarg :link1
    :type cl:boolean
    :initform cl:nil)
   (link2
    :reader link2
    :initarg :link2
    :type cl:boolean
    :initform cl:nil)
   (link3
    :reader link3
    :initarg :link3
    :type cl:boolean
    :initform cl:nil)
   (link4
    :reader link4
    :initarg :link4
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

(cl:defclass hand_to_stm (<hand_to_stm>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <hand_to_stm>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'hand_to_stm)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name patrol_robot-msg:<hand_to_stm> is deprecated: use patrol_robot-msg:hand_to_stm instead.")))

(cl:ensure-generic-function 'left_on_off-val :lambda-list '(m))
(cl:defmethod left_on_off-val ((m <hand_to_stm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_robot-msg:left_on_off-val is deprecated.  Use patrol_robot-msg:left_on_off instead.")
  (left_on_off m))

(cl:ensure-generic-function 'right_on_off-val :lambda-list '(m))
(cl:defmethod right_on_off-val ((m <hand_to_stm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_robot-msg:right_on_off-val is deprecated.  Use patrol_robot-msg:right_on_off instead.")
  (right_on_off m))

(cl:ensure-generic-function 'back-val :lambda-list '(m))
(cl:defmethod back-val ((m <hand_to_stm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_robot-msg:back-val is deprecated.  Use patrol_robot-msg:back instead.")
  (back m))

(cl:ensure-generic-function 'link1-val :lambda-list '(m))
(cl:defmethod link1-val ((m <hand_to_stm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_robot-msg:link1-val is deprecated.  Use patrol_robot-msg:link1 instead.")
  (link1 m))

(cl:ensure-generic-function 'link2-val :lambda-list '(m))
(cl:defmethod link2-val ((m <hand_to_stm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_robot-msg:link2-val is deprecated.  Use patrol_robot-msg:link2 instead.")
  (link2 m))

(cl:ensure-generic-function 'link3-val :lambda-list '(m))
(cl:defmethod link3-val ((m <hand_to_stm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_robot-msg:link3-val is deprecated.  Use patrol_robot-msg:link3 instead.")
  (link3 m))

(cl:ensure-generic-function 'link4-val :lambda-list '(m))
(cl:defmethod link4-val ((m <hand_to_stm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_robot-msg:link4-val is deprecated.  Use patrol_robot-msg:link4 instead.")
  (link4 m))

(cl:ensure-generic-function 'front_lwheel_target_velocity-val :lambda-list '(m))
(cl:defmethod front_lwheel_target_velocity-val ((m <hand_to_stm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_robot-msg:front_lwheel_target_velocity-val is deprecated.  Use patrol_robot-msg:front_lwheel_target_velocity instead.")
  (front_lwheel_target_velocity m))

(cl:ensure-generic-function 'front_rwheel_target_velocity-val :lambda-list '(m))
(cl:defmethod front_rwheel_target_velocity-val ((m <hand_to_stm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_robot-msg:front_rwheel_target_velocity-val is deprecated.  Use patrol_robot-msg:front_rwheel_target_velocity instead.")
  (front_rwheel_target_velocity m))

(cl:ensure-generic-function 'back_lwheel_target_velocity-val :lambda-list '(m))
(cl:defmethod back_lwheel_target_velocity-val ((m <hand_to_stm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_robot-msg:back_lwheel_target_velocity-val is deprecated.  Use patrol_robot-msg:back_lwheel_target_velocity instead.")
  (back_lwheel_target_velocity m))

(cl:ensure-generic-function 'back_rwheel_target_velocity-val :lambda-list '(m))
(cl:defmethod back_rwheel_target_velocity-val ((m <hand_to_stm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_robot-msg:back_rwheel_target_velocity-val is deprecated.  Use patrol_robot-msg:back_rwheel_target_velocity instead.")
  (back_rwheel_target_velocity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <hand_to_stm>) ostream)
  "Serializes a message object of type '<hand_to_stm>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'left_on_off) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'right_on_off) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'back) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'link1) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'link2) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'link3) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'link4) 1 0)) ostream)
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <hand_to_stm>) istream)
  "Deserializes a message object of type '<hand_to_stm>"
    (cl:setf (cl:slot-value msg 'left_on_off) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'right_on_off) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'back) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'link1) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'link2) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'link3) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'link4) (cl:not (cl:zerop (cl:read-byte istream))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<hand_to_stm>)))
  "Returns string type for a message object of type '<hand_to_stm>"
  "patrol_robot/hand_to_stm")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'hand_to_stm)))
  "Returns string type for a message object of type 'hand_to_stm"
  "patrol_robot/hand_to_stm")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<hand_to_stm>)))
  "Returns md5sum for a message object of type '<hand_to_stm>"
  "82523fc330078554e8f233fc1ade438a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'hand_to_stm)))
  "Returns md5sum for a message object of type 'hand_to_stm"
  "82523fc330078554e8f233fc1ade438a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<hand_to_stm>)))
  "Returns full string definition for message of type '<hand_to_stm>"
  (cl:format cl:nil "bool  left_on_off~%bool  right_on_off~%bool  back~%bool  link1~%bool  link2~%bool  link3~%bool  link4~%float32 front_lwheel_target_velocity~%float32 front_rwheel_target_velocity~%float32 back_lwheel_target_velocity~%float32 back_rwheel_target_velocity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'hand_to_stm)))
  "Returns full string definition for message of type 'hand_to_stm"
  (cl:format cl:nil "bool  left_on_off~%bool  right_on_off~%bool  back~%bool  link1~%bool  link2~%bool  link3~%bool  link4~%float32 front_lwheel_target_velocity~%float32 front_rwheel_target_velocity~%float32 back_lwheel_target_velocity~%float32 back_rwheel_target_velocity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <hand_to_stm>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
     1
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <hand_to_stm>))
  "Converts a ROS message object to a list"
  (cl:list 'hand_to_stm
    (cl:cons ':left_on_off (left_on_off msg))
    (cl:cons ':right_on_off (right_on_off msg))
    (cl:cons ':back (back msg))
    (cl:cons ':link1 (link1 msg))
    (cl:cons ':link2 (link2 msg))
    (cl:cons ':link3 (link3 msg))
    (cl:cons ':link4 (link4 msg))
    (cl:cons ':front_lwheel_target_velocity (front_lwheel_target_velocity msg))
    (cl:cons ':front_rwheel_target_velocity (front_rwheel_target_velocity msg))
    (cl:cons ':back_lwheel_target_velocity (back_lwheel_target_velocity msg))
    (cl:cons ':back_rwheel_target_velocity (back_rwheel_target_velocity msg))
))
