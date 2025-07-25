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
  version = "0.1.0-3";
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
        rev = "1a9601c4716c80a446627bcccb523b744a5d82e5";
        hash = "sha256-yOMGmLkbazsZjj5Ki7Z7Ebpm0gD6sslUfa2UqvEvFK8=";
      };
    };
  });
  meta = {
    description = "ros2_control hardware interface for Feetech Servos";
  };
})
