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
  version = "1.1.7-1";
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
        rev = "e6dcec0f88de9adf9d306999dae4afb8c66257d2";
        hash = "sha256-kk92BK/UJ9ufWwT9MWEDfrAFzFug60n5vRPZQCSL/DQ=";
      };
    };
  });
  meta = {
    description = "\n    Joint Trajectory Command Broadcaster ROS 2 package.\n  ";
  };
})
