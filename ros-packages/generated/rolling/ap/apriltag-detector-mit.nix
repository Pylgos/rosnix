{
  ament-cmake,
  ament-cmake-auto,
  ament-cmake-clang-format,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  apriltag-detector,
  apriltag-mit,
  apriltag-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-components,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "apriltag_detector_mit";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."apriltag_detector_mit";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ros-environment ];
  propagatedNativeBuildInputs = [ apriltag-detector apriltag-mit apriltag-msgs pluginlib rclcpp rclcpp-components sensor-msgs ];
  buildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ros-environment ];
  propagatedBuildInputs = [ apriltag-detector apriltag-mit apriltag-msgs pluginlib rclcpp rclcpp-components sensor-msgs ];
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "apriltag_detector_mit" = substituteSource {
      src = fetchgit {
        name = "apriltag_detector_mit-source";
        url = "https://github.com/ros2-gbp/apriltag_detector-release.git";
        rev = "593eecade1ee367dca8cc0ecb26bdb9db129c620";
        hash = "sha256-SEkxk1qYeI7p6bvQofHY3KuhemcCBRhBS9vwfbTajO8=";
      };
    };
  });
  meta = {
    description = "ROS package for apriltag detection with MIT detector";
  };
})
