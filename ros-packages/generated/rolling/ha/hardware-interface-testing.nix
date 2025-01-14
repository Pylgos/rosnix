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
  version = "4.24.0-1";
  src = finalAttrs.passthru.sources."hardware_interface_testing";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ control-msgs hardware-interface lifecycle-msgs pluginlib rclcpp-lifecycle ros2-control-test-assets ];
  checkInputs = [ ament-cmake-gmock ];
  passthru.sources = mkSourceSet (sources: {
    "hardware_interface_testing" = substituteSource {
      src = fetchgit {
        name = "hardware_interface_testing-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "f4c232f3f4ec6c8ebc4c3a4eadb5db85e91e21d2";
        hash = "sha256-v1xjEV0rHJ2vn1yMjOnxxkoH5cmMrWq9sYmiIx2YqzY=";
      };
    };
  });
  meta = {
    description = "ros2_control hardware interface testing";
  };
})
