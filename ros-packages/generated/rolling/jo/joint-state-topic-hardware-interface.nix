{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-ros,
  angles,
  buildAmentCmakePackage,
  control-msgs,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  forward-command-controller,
  hardware-interface,
  joint-state-broadcaster,
  joint-trajectory-controller,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ament-cmake,
  mkSourceSet,
  rclcpp,
  rclpy,
  robot-state-publisher,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  topic-tools,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "joint_state_topic_hardware_interface";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."joint_state_topic_hardware_interface";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles hardware-interface rclcpp ros2-control-cmake sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles hardware-interface rclcpp ros2-control-cmake sensor-msgs ];
  checkInputs = [ ament-cmake-gmock ament-cmake-ros control-msgs controller-manager forward-command-controller joint-state-broadcaster joint-trajectory-controller launch launch-ros launch-testing launch-testing-ament-cmake rclpy robot-state-publisher ros2-control-test-assets topic-tools xacro ];
  passthru.sources = mkSourceSet (sources: {
    "joint_state_topic_hardware_interface" = substituteSource {
      src = fetchgit {
        name = "joint_state_topic_hardware_interface-source";
        url = "https://github.com/ros2-gbp/topic_based_hardware-release.git";
        rev = "c404adeb05771c8718745daf754add52feb71e55";
        hash = "sha256-zD6NzOuMOAOqh94Dg7wpN6NVopyY5Njd49r9XEO0ask=";
      };
    };
  });
  meta = {
    description = "\n    ros2_control hardware interface for JointState topic based control\n  ";
  };
})
