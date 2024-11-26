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
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
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
  pname = "apriltag_detector_umich";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."apriltag_detector_umich";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ros-environment ];
  propagatedBuildInputs = [ apriltag apriltag-detector apriltag-msgs cv-bridge image-transport pluginlib rclcpp rclcpp-components sensor-msgs ];
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "apriltag_detector_umich" = substituteSource {
        src = fetchgit {
          name = "apriltag_detector_umich-source";
          url = "https://github.com/ros2-gbp/apriltag_detector-release.git";
          rev = "b9f3375255a5b2b64a44202a618273c318389c3a";
          hash = "sha256-+DFXS65T4DDOtMzxOjIdGqvpD5wtTKL3o+uo7bGsw0I=";
        };
      };
    });
  };
  meta = {
    description = "ROS package for apriltag detection with the UMich detector";
  };
})
