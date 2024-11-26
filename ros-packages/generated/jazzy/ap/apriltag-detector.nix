{
  ament-cmake,
  ament-cmake-auto,
  ament-cmake-clang-format,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  apriltag,
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
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "apriltag_detector";
  version = "1.0.0-3";
  src = finalAttrs.passthru.sources."apriltag_detector";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ];
  propagatedBuildInputs = [ apriltag apriltag-msgs cv-bridge image-transport rclcpp rclcpp-components sensor-msgs ];
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "apriltag_detector" = substituteSource {
        src = fetchgit {
          name = "apriltag_detector-source";
          url = "https://github.com/ros2-gbp/apriltag_detector-release.git";
          rev = "4793979b66ea90f82cabfea99db22a25a732e435";
          hash = "sha256-jOHnmzOSEBudRKyE4FGX5VDw7JIfjVJ2gcmiwcNz4jQ=";
        };
      };
    });
  };
  meta = {
    description = "ROS package for apriltag detection";
  };
})
