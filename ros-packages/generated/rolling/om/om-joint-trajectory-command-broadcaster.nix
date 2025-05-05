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
  version = "3.2.2-1";
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
        rev = "18b4fda94d666dc8068c48a3693525850715b466";
        hash = "sha256-te78p+tcaF1o/Fc955V77cAnCLCCKExarkk3GSliLBs=";
      };
    };
  });
  meta = {
    description = "\n    Joint Trajectory Command Broadcaster ROS 2 package.\n  ";
  };
})
