{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tl-expected,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "feetech_ros2_driver";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."feetech_ros2_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ hardware-interface pluginlib rclcpp tl-expected ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "libserial-dev" "pkg-config" "range-v3" "spdlog" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ hardware-interface pluginlib rclcpp tl-expected ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "libserial-dev" "pkg-config" "range-v3" "spdlog" ]; };
  passthru.sources = mkSourceSet (sources: {
    "feetech_ros2_driver" = substituteSource {
      src = fetchgit {
        name = "feetech_ros2_driver-source";
        url = "https://github.com/ros2-gbp/feetech_ros2_driver-release.git";
        rev = "13535b2a63cb833460b61abd91545f9c8d256128";
        hash = "sha256-wr5hlRdRZrLUGcC1Kq49XSRbSldpWF6MZpYxCdF07sY=";
      };
    };
  });
  meta = {
    description = "ros2_control hardware interface for Feetech Servos";
  };
})
