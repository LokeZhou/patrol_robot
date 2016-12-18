# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "patrol_robot: 3 messages, 0 services")

set(MSG_I_FLAGS "-Ipatrol_robot:/home/exbot/catkin_ws/src/patrol_robot/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(patrol_robot_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/exbot/catkin_ws/src/patrol_robot/msg/pc_to_stm.msg" NAME_WE)
add_custom_target(_patrol_robot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "patrol_robot" "/home/exbot/catkin_ws/src/patrol_robot/msg/pc_to_stm.msg" ""
)

get_filename_component(_filename "/home/exbot/catkin_ws/src/patrol_robot/msg/hand_to_stm.msg" NAME_WE)
add_custom_target(_patrol_robot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "patrol_robot" "/home/exbot/catkin_ws/src/patrol_robot/msg/hand_to_stm.msg" ""
)

get_filename_component(_filename "/home/exbot/catkin_ws/src/patrol_robot/msg/stm_to_pc.msg" NAME_WE)
add_custom_target(_patrol_robot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "patrol_robot" "/home/exbot/catkin_ws/src/patrol_robot/msg/stm_to_pc.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(patrol_robot
  "/home/exbot/catkin_ws/src/patrol_robot/msg/stm_to_pc.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/patrol_robot
)
_generate_msg_cpp(patrol_robot
  "/home/exbot/catkin_ws/src/patrol_robot/msg/hand_to_stm.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/patrol_robot
)
_generate_msg_cpp(patrol_robot
  "/home/exbot/catkin_ws/src/patrol_robot/msg/pc_to_stm.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/patrol_robot
)

### Generating Services

### Generating Module File
_generate_module_cpp(patrol_robot
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/patrol_robot
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(patrol_robot_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(patrol_robot_generate_messages patrol_robot_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/exbot/catkin_ws/src/patrol_robot/msg/pc_to_stm.msg" NAME_WE)
add_dependencies(patrol_robot_generate_messages_cpp _patrol_robot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/catkin_ws/src/patrol_robot/msg/hand_to_stm.msg" NAME_WE)
add_dependencies(patrol_robot_generate_messages_cpp _patrol_robot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/catkin_ws/src/patrol_robot/msg/stm_to_pc.msg" NAME_WE)
add_dependencies(patrol_robot_generate_messages_cpp _patrol_robot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(patrol_robot_gencpp)
add_dependencies(patrol_robot_gencpp patrol_robot_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS patrol_robot_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(patrol_robot
  "/home/exbot/catkin_ws/src/patrol_robot/msg/stm_to_pc.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/patrol_robot
)
_generate_msg_lisp(patrol_robot
  "/home/exbot/catkin_ws/src/patrol_robot/msg/hand_to_stm.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/patrol_robot
)
_generate_msg_lisp(patrol_robot
  "/home/exbot/catkin_ws/src/patrol_robot/msg/pc_to_stm.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/patrol_robot
)

### Generating Services

### Generating Module File
_generate_module_lisp(patrol_robot
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/patrol_robot
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(patrol_robot_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(patrol_robot_generate_messages patrol_robot_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/exbot/catkin_ws/src/patrol_robot/msg/pc_to_stm.msg" NAME_WE)
add_dependencies(patrol_robot_generate_messages_lisp _patrol_robot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/catkin_ws/src/patrol_robot/msg/hand_to_stm.msg" NAME_WE)
add_dependencies(patrol_robot_generate_messages_lisp _patrol_robot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/catkin_ws/src/patrol_robot/msg/stm_to_pc.msg" NAME_WE)
add_dependencies(patrol_robot_generate_messages_lisp _patrol_robot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(patrol_robot_genlisp)
add_dependencies(patrol_robot_genlisp patrol_robot_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS patrol_robot_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(patrol_robot
  "/home/exbot/catkin_ws/src/patrol_robot/msg/stm_to_pc.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_robot
)
_generate_msg_py(patrol_robot
  "/home/exbot/catkin_ws/src/patrol_robot/msg/hand_to_stm.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_robot
)
_generate_msg_py(patrol_robot
  "/home/exbot/catkin_ws/src/patrol_robot/msg/pc_to_stm.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_robot
)

### Generating Services

### Generating Module File
_generate_module_py(patrol_robot
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_robot
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(patrol_robot_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(patrol_robot_generate_messages patrol_robot_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/exbot/catkin_ws/src/patrol_robot/msg/pc_to_stm.msg" NAME_WE)
add_dependencies(patrol_robot_generate_messages_py _patrol_robot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/catkin_ws/src/patrol_robot/msg/hand_to_stm.msg" NAME_WE)
add_dependencies(patrol_robot_generate_messages_py _patrol_robot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/catkin_ws/src/patrol_robot/msg/stm_to_pc.msg" NAME_WE)
add_dependencies(patrol_robot_generate_messages_py _patrol_robot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(patrol_robot_genpy)
add_dependencies(patrol_robot_genpy patrol_robot_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS patrol_robot_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/patrol_robot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/patrol_robot
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(patrol_robot_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/patrol_robot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/patrol_robot
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(patrol_robot_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_robot)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_robot\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/patrol_robot
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(patrol_robot_generate_messages_py std_msgs_generate_messages_py)
