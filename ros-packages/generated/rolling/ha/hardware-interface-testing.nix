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
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "hardware_interface_testing";
  version = "4.28.1-1";
  src = finalAttrs.passthru.sources."hardware_interface_testing";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp-lifecycle ];
  propagatedBuildInputs = [ control-msgs hardware-interface lifecycle-msgs pluginlib ros2-control-cmake ros2-control-test-assets ];
  checkInputs = [ ament-cmake-gmock ];
  passthru.sources = mkSourceSet (sources: {
    "hardware_interface_testing" = substituteSource {
      src = fetchgit {
        name = "hardware_interface_testing-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "22b0efe276c282909c511a4140566edb2f356d7f";
        hash = "sha256-1LCxqv7xE971fCO2SssZceCd5MFm0Va7pN78LgtW52Y=";
      };
    };
  });
  meta = {
    description = "Commonly used test fixtures for the ros2_control framework";
  };
})
