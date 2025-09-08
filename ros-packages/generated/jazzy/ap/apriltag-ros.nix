{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-cppcheck,
  ament-lint-auto,
  apriltag,
  apriltag-msgs,
  buildAmentCmakePackage,
  camera-ros,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-proc,
  image-transport,
  image-transport-plugins,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "apriltag_ros";
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."apriltag_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ apriltag apriltag-msgs camera-ros cv-bridge image-proc image-transport image-transport-plugins rclcpp rclcpp-components sensor-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ apriltag apriltag-msgs camera-ros cv-bridge image-proc image-transport image-transport-plugins rclcpp rclcpp-components sensor-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-clang-format ament-cmake-cppcheck ament-lint-auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "clang-format" ]; };
  passthru.sources = mkSourceSet (sources: {
    "apriltag_ros" = substituteSource {
      src = fetchgit {
        name = "apriltag_ros-source";
        url = "https://github.com/ros2-gbp/apriltag_ros-release.git";
        rev = "6c78a3c632747934aa2154645b1c508965267a67";
        hash = "sha256-1QnwKFz7U3tyRSiWEZfp8VrKNFgD0ivenI4JOLcIP6g=";
      };
    };
  });
  meta = {
    description = "AprilTag detection node";
  };
})
