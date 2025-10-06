{
  ament-cmake,
  ament-cmake-gmock,
  angles,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  joint-state-broadcaster,
  joint-trajectory-controller,
  launch,
  launch-ros,
  launch-testing,
  mkSourceSet,
  rclcpp,
  rclpy,
  robot-state-publisher,
  ros-testing,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "joint_state_topic_hardware_interface";
  version = "0.2.1-1";
  src = finalAttrs.passthru.sources."joint_state_topic_hardware_interface";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles hardware-interface rclcpp ros2-control-cmake sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles hardware-interface rclcpp ros2-control-cmake sensor-msgs ];
  checkInputs = [ ament-cmake-gmock controller-manager joint-state-broadcaster joint-trajectory-controller launch launch-ros launch-testing rclpy robot-state-publisher ros2-control-test-assets ros-testing xacro ];
  passthru.sources = mkSourceSet (sources: {
    "joint_state_topic_hardware_interface" = substituteSource {
      src = fetchgit {
        name = "joint_state_topic_hardware_interface-source";
        url = "https://github.com/ros2-gbp/topic_based_hardware-release.git";
        rev = "ebfc6d81121af05b235fd4cdb464d6b3911e072c";
        hash = "sha256-WgGTWu1/+ZhnSFWhEliy7Ks5q6eSSOCuZDhWeOvlbXc=";
      };
    };
  });
  meta = {
    description = "\n    ros2_control hardware interface for JointState topic based control\n  ";
  };
})
