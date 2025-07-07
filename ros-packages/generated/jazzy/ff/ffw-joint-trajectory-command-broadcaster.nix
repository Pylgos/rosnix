{
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
  buildAmentCmakePackage,
  builtin-interfaces,
  control-msgs,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  hardware-interface,
  hardware-interface-testing,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rcutils,
  realtime-tools,
  ros2-control-test-assets,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  trajectory-msgs,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ffw_joint_trajectory_command_broadcaster";
  version = "1.1.5-1";
  src = finalAttrs.passthru.sources."ffw_joint_trajectory_command_broadcaster";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros builtin-interfaces control-msgs controller-interface generate-parameter-library pluginlib rclcpp-lifecycle rcutils realtime-tools sensor-msgs trajectory-msgs urdf ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros builtin-interfaces control-msgs controller-interface generate-parameter-library pluginlib rclcpp-lifecycle rcutils realtime-tools sensor-msgs trajectory-msgs urdf ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface hardware-interface-testing rclcpp ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "ffw_joint_trajectory_command_broadcaster" = substituteSource {
      src = fetchgit {
        name = "ffw_joint_trajectory_command_broadcaster-source";
        url = "https://github.com/ros2-gbp/ai_worker-release.git";
        rev = "fa63633c83ac7241b414a949530f8c936bff614e";
        hash = "sha256-MDSbZmPVnZXvZOMqL62mWgad7S52IQII9IZ+hfj/wyQ=";
      };
    };
  });
  meta = {
    description = "\n    Joint Trajectory Command Broadcaster ROS 2 package.\n  ";
  };
})
