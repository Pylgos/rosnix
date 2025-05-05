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
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."apriltag_detector_umich";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ros-environment ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ apriltag apriltag-detector apriltag-msgs pluginlib sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "apriltag_detector_umich" = substituteSource {
      src = fetchgit {
        name = "apriltag_detector_umich-source";
        url = "https://github.com/ros2-gbp/apriltag_detector-release.git";
        rev = "f5de0fd4abb90b18fba70d310849c8f412be8765";
        hash = "sha256-LmlSDbAGEy1NgRq4f3pxb0tkLb+aHLshDzEb4zScFvc=";
      };
    };
  });
  meta = {
    description = "ROS package for apriltag detection with the UMich detector";
  };
})
