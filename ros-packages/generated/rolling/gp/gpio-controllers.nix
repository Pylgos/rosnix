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
  version = "5.7.0-1";
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
        rev = "c06bba4235c9f9ccf1bbfb17c60e45af055998b9";
        hash = "sha256-ghGBDq0eJgveKGBZ/MnW/ccNvH2PGKtgk4KKnnbikGc=";
      };
    };
  });
  meta = {
    description = "Controllers to interact with gpios.";
  };
})
