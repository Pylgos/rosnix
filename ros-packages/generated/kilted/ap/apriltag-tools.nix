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
  version = "3.0.3-1";
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
        rev = "656905b0a1ed7b950bfcd90f1098d9af7cea28da";
        hash = "sha256-YsUFbS1tpau9/azhXoN68wAFlHiJsE+gFYy/aIyPb8w=";
      };
    };
  });
  meta = {
    description = "misc tools for working with apriltags under ROS2";
  };
})
