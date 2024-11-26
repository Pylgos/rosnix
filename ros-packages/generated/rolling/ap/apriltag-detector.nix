{
  ament-cmake,
  ament-cmake-auto,
  ament-cmake-clang-format,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
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
  pname = "apriltag_detector";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."apriltag_detector";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ros-environment ];
  propagatedBuildInputs = [ apriltag-msgs pluginlib rclcpp rclcpp-components sensor-msgs ];
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "apriltag_detector" = substituteSource {
        src = fetchgit {
          name = "apriltag_detector-source";
          url = "https://github.com/ros2-gbp/apriltag_detector-release.git";
          rev = "0fc1d9d94f0f94656eddf0aab4f20cd3f911b302";
          hash = "sha256-iw/b7F4XHEzACalAypSBbAltkD0O69nSKk5qIc+yRIA=";
        };
      };
    });
  };
  meta = {
    description = "ROS2 package for apriltag detection";
  };
})
