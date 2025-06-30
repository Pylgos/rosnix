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
  version = "4.27.0-1";
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
        rev = "abf8a4df59ec236f8849058be2f23145cc4c6042";
        hash = "sha256-xGN340rqGlN9sSjqG6nOrzGMO70NTfWaPpl6Lr1p87k=";
      };
    };
  });
  meta = {
    description = "Controller based on PID implememenation from control_toolbox package.";
  };
})
