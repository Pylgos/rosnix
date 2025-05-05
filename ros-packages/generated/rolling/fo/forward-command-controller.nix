{
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
  buildAmentCmakePackage,
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
  realtime-tools,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "forward_command_controller";
  version = "4.24.0-1";
  src = finalAttrs.passthru.sources."forward_command_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ generate-parameter-library rclcpp rclcpp-lifecycle ];
  propagatedBuildInputs = [ backward-ros controller-interface hardware-interface pluginlib realtime-tools ros2-control-cmake std-msgs ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "forward_command_controller" = substituteSource {
      src = fetchgit {
        name = "forward_command_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "6209b60f73446b0f8e3b12b5a9a5535f90a9e46a";
        hash = "sha256-l6cIvu4SDkBMqpZRiTSJgOla0uqPSB3+jSI0nd0U47g=";
      };
    };
  });
  meta = {
    description = "Generic controller for forwarding commands.";
  };
})
