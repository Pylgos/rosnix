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
  pname = "om_joint_trajectory_command_broadcaster";
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."om_joint_trajectory_command_broadcaster";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros builtin-interfaces control-msgs controller-interface generate-parameter-library pluginlib rclcpp-lifecycle rcutils realtime-tools sensor-msgs trajectory-msgs urdf ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface hardware-interface-testing rclcpp ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "om_joint_trajectory_command_broadcaster" = substituteSource {
      src = fetchgit {
        name = "om_joint_trajectory_command_broadcaster-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "968fd80aec87e2c769cc827ed190a3d699320d3e";
        hash = "sha256-+e8Y9jYSUAmafrSMO9qhHYpbuPC2ZXgOyqPipfcWs6k=";
      };
    };
  });
  meta = {
    description = "Joint Trajectory Command Broadcaster ROS 2 package.";
  };
})
