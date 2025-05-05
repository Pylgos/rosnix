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
  version = "0.1.0-2";
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
        rev = "c619e79809de4c3c96c1cace062704ab4b572935";
        hash = "sha256-yOMGmLkbazsZjj5Ki7Z7Ebpm0gD6sslUfa2UqvEvFK8=";
      };
    };
  });
  meta = {
    description = "ros2_control hardware interface for Feetech Servos";
  };
})
