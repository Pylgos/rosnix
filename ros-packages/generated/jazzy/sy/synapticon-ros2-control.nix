{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  forward-command-controller,
  hardware-interface,
  joint-state-broadcaster,
  joint-trajectory-controller,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  robot-state-publisher,
  ros-testing,
  ros2controlcli,
  ros2launch,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "synapticon_ros2_control";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."synapticon_ros2_control";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager forward-command-controller hardware-interface joint-state-broadcaster joint-trajectory-controller pluginlib rclcpp rclcpp-lifecycle robot-state-publisher ros2controlcli ros2launch rviz2 xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libcap-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager forward-command-controller hardware-interface joint-state-broadcaster joint-trajectory-controller pluginlib rclcpp rclcpp-lifecycle robot-state-publisher ros2controlcli ros2launch rviz2 xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libcap-dev" ]; };
  checkInputs = [ ament-cmake-gtest ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "synapticon_ros2_control" = substituteSource {
      src = fetchgit {
        name = "synapticon_ros2_control-source";
        url = "https://github.com/synapticon/synapticon_ros2_control-release.git";
        rev = "1cf1ff9d4721818e12e8be5388e06aed49a9dee6";
        hash = "sha256-42VC0PEbQlQ/rlaRkJyKqSWtoMyQfvOKxd8kCEzScgQ=";
      };
    };
  });
  meta = {
    description = "A ros2_control interface for Synapticon motor drivers";
  };
})
