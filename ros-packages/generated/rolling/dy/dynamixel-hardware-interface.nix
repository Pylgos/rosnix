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
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."dynamixel_hardware_interface";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dynamixel-interfaces dynamixel-sdk hardware-interface pluginlib rclcpp realtime-tools std-srvs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dynamixel_hardware_interface" = substituteSource {
      src = fetchgit {
        name = "dynamixel_hardware_interface-source";
        url = "https://github.com/ros2-gbp/dynamixel_hardware_interface-release.git";
        rev = "c6d997a0979e77a4651c6a9949c3269fbf8ce107";
        hash = "sha256-nDIDrYOZ9GkkDCPuoBT/Z94TxqUSYKdHLYLh476sik8=";
      };
    };
  });
  meta = {
    description = "ROS 2 package providing a hardware interface for controlling Dynamixel motors via the ROS 2 control framework.";
  };
})
