{
  ament-cmake,
  ament-cmake-clang-format,
  ament-lint-auto,
  ament-lint-common,
  apriltag-detector,
  apriltag-draw,
  apriltag-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rosbag2-transport,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "apriltag_tools";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."apriltag_tools";
  nativeBuildInputs = [ ament-cmake ros-environment ];
  propagatedNativeBuildInputs = [ apriltag-detector apriltag-draw apriltag-msgs rclcpp rosbag2-transport ];
  buildInputs = [ ament-cmake ros-environment ];
  propagatedBuildInputs = [ apriltag-detector apriltag-draw apriltag-msgs rclcpp rosbag2-transport ];
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "apriltag_tools" = substituteSource {
      src = fetchgit {
        name = "apriltag_tools-source";
        url = "https://github.com/ros2-gbp/apriltag_detector-release.git";
        rev = "803a3cea6c0269fe583276d3201dccbf494bf3f6";
        hash = "sha256-wOxpgTjflCmKsyuCgm00Lt243NH+2uIlM3CjbkkTDss=";
      };
    };
  });
  meta = {
    description = "misc tools for working with apriltags under ROS2";
  };
})
