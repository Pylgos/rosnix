{
  ament-cmake,
  ament-cmake-gmock,
  buildAmentCmakePackage,
  control-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  lifecycle-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp-lifecycle,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "hardware_interface_testing";
  version = "4.20.0-1";
  src = finalAttrs.passthru.sources."hardware_interface_testing";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ control-msgs hardware-interface lifecycle-msgs pluginlib rclcpp-lifecycle ros2-control-test-assets ];
  checkInputs = [ ament-cmake-gmock ];
  passthru = {
    sources = mkSourceSet (sources: {
      "hardware_interface_testing" = substituteSource {
        src = fetchgit {
          name = "hardware_interface_testing-source";
          url = "https://github.com/ros2-gbp/ros2_control-release.git";
          rev = "a5dd500583cd45eb0779953ed0a4528e8eebd50e";
          hash = "sha256-8W1QQ3WsO+6QJwQZv/vzCv87ybjQWB+QCDewhHHQL8A=";
        };
      };
    });
  };
  meta = {
    description = "ros2_control hardware interface testing";
  };
})
