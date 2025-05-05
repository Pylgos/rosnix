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
  propagatedNativeBuildInputs = [ rclcpp tl-expected ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "pkg-config" "spdlog" ]; };
  propagatedBuildInputs = [ hardware-interface pluginlib ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libserial-dev" "range-v3" ]; };
  passthru.sources = mkSourceSet (sources: {
    "feetech_ros2_driver" = substituteSource {
      src = fetchgit {
        name = "feetech_ros2_driver-source";
        url = "https://github.com/ros2-gbp/feetech_ros2_driver-release.git";
        rev = "7803534b0db33394dfafa5240bb1d2584d2f81d4";
        hash = "sha256-yOMGmLkbazsZjj5Ki7Z7Ebpm0gD6sslUfa2UqvEvFK8=";
      };
    };
  });
  meta = {
    description = "ros2_control hardware interface for Feetech Servos";
  };
})
