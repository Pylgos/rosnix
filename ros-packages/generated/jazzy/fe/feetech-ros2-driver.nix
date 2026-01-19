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
  version = "0.2.1-1";
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
        rev = "d447b1999008c9986346018496bce2d9a8594996";
        hash = "sha256-uEktnGgAmSO6bzy798Dr188B1ZgjTRkpR+W38rsewQ4=";
      };
    };
  });
  meta = {
    description = "ros2_control hardware interface for Feetech Servos";
  };
})
