{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fkie_message_filters";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."fkie_message_filters";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ image-transport rclcpp sensor-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-cmake-ros rclcpp-lifecycle std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "fkie_message_filters" = substituteSource {
      src = fetchgit {
        name = "fkie_message_filters-source";
        url = "https://github.com/ros2-gbp/fkie_message_filters-release.git";
        rev = "44987bf6451400f87ae4eeb2d86cb4d38bd71f5c";
        hash = "sha256-qkTyTHlCruxsKm2WyEgbZshdW0D6b11okjT3w4Aqn4k=";
      };
    };
  });
  meta = {
    description = "Improved ROS message filters";
  };
})
