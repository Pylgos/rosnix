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
  version = "4.32.0-1";
  src = finalAttrs.passthru.sources."hardware_interface_testing";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ control-msgs hardware-interface lifecycle-msgs pluginlib rclcpp-lifecycle ros2-control-cmake ros2-control-test-assets ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ control-msgs hardware-interface lifecycle-msgs pluginlib rclcpp-lifecycle ros2-control-cmake ros2-control-test-assets ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  checkInputs = [ ament-cmake-gmock ];
  passthru.sources = mkSourceSet (sources: {
    "hardware_interface_testing" = substituteSource {
      src = fetchgit {
        name = "hardware_interface_testing-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "22afaf85140301799417dca47f5f56478bc20dcd";
        hash = "sha256-eGBaLXw/62Uu9hmZq9YjMP9zHPA2/zaJbxXV/8wcUrs=";
      };
    };
  });
  meta = {
    description = "Commonly used test fixtures for the ros2_control framework";
  };
})
