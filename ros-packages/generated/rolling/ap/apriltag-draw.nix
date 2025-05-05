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
  version = "3.0.1-2";
  src = finalAttrs.passthru.sources."apriltag_draw";
  nativeBuildInputs = [ ament-cmake ros-environment ];
  propagatedNativeBuildInputs = [ apriltag-msgs cv-bridge image-transport rclcpp rclcpp-components sensor-msgs ];
  buildInputs = [ ament-cmake ros-environment ];
  propagatedBuildInputs = [ apriltag-msgs cv-bridge image-transport rclcpp rclcpp-components sensor-msgs ];
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "apriltag_draw" = substituteSource {
      src = fetchgit {
        name = "apriltag_draw-source";
        url = "https://github.com/ros2-gbp/apriltag_detector-release.git";
        rev = "9157df16a37693f6d64c6d8e8f9e4a5ffe0e9550";
        hash = "sha256-rveOYYsEpWWvWr+pTYAEbaBkV2cvQ7DdUxqtZSBCP2E=";
      };
    };
  });
  meta = {
    description = "ROS package for drawing apriltags on image";
  };
})
