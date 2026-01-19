{
  ament-cmake,
  backward-ros,
  buildAmentCmakePackage,
  builtin-interfaces,
  control-msgs,
  controller-interface,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  mkSourceSet,
  pluginlib,
  rclcpp-lifecycle,
  rcutils,
  realtime-tools,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  trajectory-msgs,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "om_joint_trajectory_command_broadcaster";
  version = "4.1.2-1";
  src = finalAttrs.passthru.sources."om_joint_trajectory_command_broadcaster";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros builtin-interfaces control-msgs controller-interface generate-parameter-library pluginlib rclcpp-lifecycle rcutils realtime-tools sensor-msgs trajectory-msgs urdf ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros builtin-interfaces control-msgs controller-interface generate-parameter-library pluginlib rclcpp-lifecycle rcutils realtime-tools sensor-msgs trajectory-msgs urdf ];
  passthru.sources = mkSourceSet (sources: {
    "om_joint_trajectory_command_broadcaster" = substituteSource {
      src = fetchgit {
        name = "om_joint_trajectory_command_broadcaster-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "08e90181e4a33a6a0b719fa463e0503e5ead2370";
        hash = "sha256-QN353wleFSLv8nlTo+WOIj0ukYifXA0DuCStdZi/itc=";
      };
    };
  });
  meta = {
    description = "\n    Joint Trajectory Command Broadcaster ROS 2 package.\n  ";
  };
})
