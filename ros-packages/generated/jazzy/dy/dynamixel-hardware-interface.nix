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
  version = "1.4.3-1";
  src = finalAttrs.passthru.sources."dynamixel_hardware_interface";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dynamixel-interfaces dynamixel-sdk hardware-interface pluginlib rclcpp realtime-tools std-srvs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dynamixel_hardware_interface" = substituteSource {
      src = fetchgit {
        name = "dynamixel_hardware_interface-source";
        url = "https://github.com/ros2-gbp/dynamixel_hardware_interface-release.git";
        rev = "93d7ac58f1e4a5d14f0e6dd6959f03853c180e45";
        hash = "sha256-IcT/zZnSwklFHEe4bfOGk+QH7ZM4HQRsuQpLZm+yups=";
      };
    };
  });
  meta = {
    description = "ROS 2 package providing a hardware interface for controlling Dynamixel motors via the ROS 2 control framework.";
  };
})
