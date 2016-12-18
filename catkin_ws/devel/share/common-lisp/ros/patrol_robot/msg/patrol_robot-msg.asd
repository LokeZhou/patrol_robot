
(cl:in-package :asdf)

(defsystem "patrol_robot-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "pc_to_stm" :depends-on ("_package_pc_to_stm"))
    (:file "_package_pc_to_stm" :depends-on ("_package"))
    (:file "stm_to_pc" :depends-on ("_package_stm_to_pc"))
    (:file "_package_stm_to_pc" :depends-on ("_package"))
    (:file "hand_to_stm" :depends-on ("_package_hand_to_stm"))
    (:file "_package_hand_to_stm" :depends-on ("_package"))
  ))