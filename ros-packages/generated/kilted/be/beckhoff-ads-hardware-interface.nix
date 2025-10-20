{
  ads-vendor,
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "beckhoff_ads_hardware_interface";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."beckhoff_ads_hardware_interface";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ads-vendor hardware-interface pluginlib rclcpp rclcpp-lifecycle yaml-cpp-vendor ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ads-vendor hardware-interface pluginlib rclcpp rclcpp-lifecycle yaml-cpp-vendor ];
  passthru.sources = mkSourceSet (sources: {
    "beckhoff_ads_hardware_interface" = substituteSource {
      src = fetchgit {
        name = "beckhoff_ads_hardware_interface-source";
        url = "https://github.com/b-robotized/beckhoff_ads_driver-release.git";
        rev = "ce9b5e199e109d6b5726cf6684a06853f4dd5a1a";
        hash = "sha256-qg4JNbeUYkkuVOJ3d7kNreKHf3c55Re4MCUMK2mqplE=";
      };
    };
  });
  meta = {
    description = "Ros2Control hardware interface for integrating with Beckhoff PLC";
  };
})
