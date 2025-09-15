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
  version = "4.0.8-1";
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
        rev = "fdab52399fd1b6abc18eebdee5d7b7e54ec1da89";
        hash = "sha256-GJ8/RGTor++sWjWyyRBB8lf7KwLFtzIKGQtwHv8uf3M=";
      };
    };
  });
  meta = {
    description = "\n    Joint Trajectory Command Broadcaster ROS 2 package.\n  ";
  };
})
