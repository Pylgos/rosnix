{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  dynamixel-interfaces,
  dynamixel-sdk,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  rclcpp,
  realtime-tools,
  rosSystemPackages,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dynamixel_hardware_interface";
  version = "1.5.0-1";
  src = finalAttrs.passthru.sources."dynamixel_hardware_interface";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ dynamixel-interfaces dynamixel-sdk hardware-interface pluginlib rclcpp realtime-tools std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dynamixel-interfaces dynamixel-sdk hardware-interface pluginlib rclcpp realtime-tools std-srvs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dynamixel_hardware_interface" = substituteSource {
      src = fetchgit {
        name = "dynamixel_hardware_interface-source";
        url = "https://github.com/ros2-gbp/dynamixel_hardware_interface-release.git";
        rev = "e4f8f651811352408f42ac1324910014abea2d9f";
        hash = "sha256-y0APNiP80CFJDxXYzRApPNq0hXbyh4bJuvQsj7G+5r8=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 package providing a hardware interface for controlling Dynamixel motors via the ROS 2 control framework.\n  ";
  };
})
