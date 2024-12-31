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
  version = "4.23.0-1";
  src = finalAttrs.passthru.sources."hardware_interface_testing";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ control-msgs hardware-interface lifecycle-msgs pluginlib rclcpp-lifecycle ros2-control-test-assets ];
  checkInputs = [ ament-cmake-gmock ];
  passthru.sources = mkSourceSet (sources: {
    "hardware_interface_testing" = substituteSource {
      src = fetchgit {
        name = "hardware_interface_testing-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "0c16033da51011b12ccbdee03fa1315364b0b463";
        hash = "sha256-80rUCTxlFNr0s5hbZ2xQSlX0ZMV+XVXSJMaDOjfhRF8=";
      };
    };
  });
  meta = {
    description = "ros2_control hardware interface testing";
  };
})
