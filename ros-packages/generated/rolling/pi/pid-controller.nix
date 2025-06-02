{
  ament-cmake,
  ament-cmake-gmock,
  angles,
  backward-ros,
  buildAmentCmakePackage,
  control-msgs,
  control-toolbox,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  hardware-interface,
  hardware-interface-testing,
  mkSourceSet,
  parameter-traits,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pid_controller";
  version = "5.0.2-1";
  src = finalAttrs.passthru.sources."pid_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles backward-ros control-msgs control-toolbox controller-interface generate-parameter-library hardware-interface parameter-traits pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles backward-ros control-msgs control-toolbox controller-interface generate-parameter-library hardware-interface parameter-traits pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake std-srvs ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "pid_controller" = substituteSource {
      src = fetchgit {
        name = "pid_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "0107f53d78cd7c74a22b024bda4068eea08469aa";
        hash = "sha256-JItw1Ip1d/uWiQ3GF355L4gELyO/wOLm+pPER6MS5/4=";
      };
    };
  });
  meta = {
    description = "Controller based on PID implememenation from control_toolbox package.";
  };
})
