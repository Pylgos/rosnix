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
  pluginlib,
  rclcpp,
  rclcpp-components,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "apriltag_detector";
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."apriltag_detector";
  nativeBuildInputs = [ ament-cmake ros-environment ];
  propagatedBuildInputs = [ apriltag-msgs cv-bridge image-transport pluginlib rclcpp rclcpp-components sensor-msgs ];
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "apriltag_detector" = substituteSource {
      src = fetchgit {
        name = "apriltag_detector-source";
        url = "https://github.com/ros2-gbp/apriltag_detector-release.git";
        rev = "dfdfc2ff349bc5fe0a926093d5d9463d7592d4fd";
        hash = "sha256-vky7Ck0D3eBgyZYsbzM6Obrn3j0YWfz5uP7njgkbw9s=";
      };
    };
  });
  meta = {
    description = "ROS2 package for apriltag detection";
  };
})
