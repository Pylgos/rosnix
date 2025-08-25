{
  ament-cmake,
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
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."joint_state_topic_hardware_interface";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles hardware-interface rclcpp ros2-control-cmake sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles hardware-interface rclcpp ros2-control-cmake sensor-msgs ];
  checkInputs = [ controller-manager joint-state-broadcaster joint-trajectory-controller launch launch-ros launch-testing rclpy robot-state-publisher ros2-control-test-assets ros-testing xacro ];
  passthru.sources = mkSourceSet (sources: {
    "joint_state_topic_hardware_interface" = substituteSource {
      src = fetchgit {
        name = "joint_state_topic_hardware_interface-source";
        url = "https://github.com/ros2-gbp/topic_based_hardware-release.git";
        rev = "25e9f73a8bb851242da38157ba30354967dd656d";
        hash = "sha256-xNEkvhz5U2hZ1SF7km4W7ZkqZXzFA+Dr9uXN+XFzVpI=";
      };
    };
  });
  meta = {
    description = "\n    ros2_control hardware interface for JointState topic based control\n  ";
  };
})
