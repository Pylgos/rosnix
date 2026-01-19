{
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  backward-ros,
  buildAmentCmakePackage,
  control-msgs,
  controller-interface,
  controller-manager,
  controller-manager-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  joint-state-broadcaster,
  joint-trajectory-controller,
  launch,
  launch-ros,
  launch-testing-ament-cmake,
  lifecycle-msgs,
  mkSourceSet,
  moveit-ros-planning-interface,
  play-motion2-msgs,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  rclcpp-lifecycle,
  realtime-tools,
  robot-state-publisher,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  trajectory-msgs,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "play_motion2";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."play_motion2";
  nativeBuildInputs = [ ament-cmake-auto ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ backward-ros control-msgs controller-manager-msgs launch launch-ros lifecycle-msgs moveit-ros-planning-interface play-motion2-msgs rclcpp rclcpp-action rclcpp-components rclcpp-lifecycle sensor-msgs std-msgs trajectory-msgs ];
  buildInputs = [ ament-cmake-auto ament-cmake-python ];
  propagatedBuildInputs = [ backward-ros control-msgs controller-manager-msgs launch launch-ros lifecycle-msgs moveit-ros-planning-interface play-motion2-msgs rclcpp rclcpp-action rclcpp-components rclcpp-lifecycle sensor-msgs std-msgs trajectory-msgs ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-index-cpp ament-lint-auto ament-lint-common controller-interface controller-manager hardware-interface joint-state-broadcaster joint-trajectory-controller launch-testing-ament-cmake pluginlib realtime-tools robot-state-publisher sensor-msgs xacro ];
  passthru.sources = mkSourceSet (sources: {
    "play_motion2" = substituteSource {
      src = fetchgit {
        name = "play_motion2-source";
        url = "https://github.com/ros2-gbp/play_motion2-release.git";
        rev = "a8ca4623870b9344bffa921efda4966a71953710";
        hash = "sha256-n2SRgdt9e2bNnLKS3nJqCzQULIpXac1tXNByNycPSFA=";
      };
    };
  });
  meta = {
    description = "Play a pre-recorded motion on a robot";
  };
})
