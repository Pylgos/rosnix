{
  ament-cmake,
  ament-cmake-auto,
  ament-cmake-clang-format,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  apriltag,
  apriltag-detector,
  apriltag-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "apriltag_detector_umich";
  version = "3.0.4-2";
  src = finalAttrs.passthru.sources."apriltag_detector_umich";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ros-environment ];
  propagatedNativeBuildInputs = [ apriltag apriltag-detector apriltag-msgs pluginlib rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ros-environment ];
  propagatedBuildInputs = [ apriltag apriltag-detector apriltag-msgs pluginlib rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "apriltag_detector_umich" = substituteSource {
      src = fetchgit {
        name = "apriltag_detector_umich-source";
        url = "https://github.com/ros2-gbp/apriltag_detector-release.git";
        rev = "ca3ab8c0f277f36402d3320d48c1f76a3b5124f9";
        hash = "sha256-vX9uCkfmbAYuGqfl1VYzs+rZs2CWX132v2zROhdLcIk=";
      };
    };
  });
  meta = {
    description = "ROS package for apriltag detection with the UMich detector";
  };
})
