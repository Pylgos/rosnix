{
  ament-cmake,
  ament-cmake-clang-format,
  ament-lint-auto,
  ament-lint-common,
  apriltag-msgs,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "apriltag_draw";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."apriltag_draw";
  nativeBuildInputs = [ ament-cmake ros-environment ];
  propagatedBuildInputs = [ apriltag-msgs cv-bridge image-transport rclcpp rclcpp-components sensor-msgs ];
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "apriltag_draw" = substituteSource {
        src = fetchgit {
          name = "apriltag_draw-source";
          url = "https://github.com/ros2-gbp/apriltag_detector-release.git";
          rev = "4294d5688ed3a8f5d236d28e07ebcd4ea332c655";
          hash = "sha256-LhikKz6PgCFGTywR7Hc1qY8jmcv7KgauD9TWIvXZDBc=";
        };
      };
    });
  };
  meta = {
    description = "ROS package for drawing apriltags on image";
  };
})
