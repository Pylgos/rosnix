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
  version = "3.0.4-1";
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
        rev = "542f45947f6cb0cf5b0640582bec903a0ad2aac9";
        hash = "sha256-qOOJV6MN2MqIYg2ATYN8IY/dLM075r5JFLROkaKJiHk=";
      };
    };
  });
  meta = {
    description = "ROS package for apriltag detection with MIT detector";
  };
})
