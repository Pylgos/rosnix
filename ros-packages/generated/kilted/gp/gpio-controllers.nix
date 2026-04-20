{
  ament-cmake,
  ament-cmake-gmock,
  buildAmentCmakePackage,
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
  realtime-tools,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gpio_controllers";
  version = "5.14.0-1";
  src = finalAttrs.passthru.sources."gpio_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ control-msgs controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ control-msgs controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "gpio_controllers" = substituteSource {
      src = fetchgit {
        name = "gpio_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "9101e830805bca2706f1b87c8a62e00a68f42f74";
        hash = "sha256-CpB/bN4U8FENGe8daN4rrjeEuM1wz5KeDlvq9B3S4LM=";
      };
    };
  });
  meta = {
    description = "Controllers to interact with gpios.";
  };
})
