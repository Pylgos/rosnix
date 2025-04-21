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
  version = "4.23.0-1";
  src = finalAttrs.passthru.sources."gpio_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ control-msgs controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "gpio_controllers" = substituteSource {
      src = fetchgit {
        name = "gpio_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "0a4a8324dde856a75e5cc06a64b069ffe545f2b2";
        hash = "sha256-Z0/9eHVCfHqk4CkQAedXOZ8d+NKVNOb/xOFm2O0a7/c=";
      };
    };
  });
  meta = {
    description = "Controllers to interact with gpios.";
  };
})
