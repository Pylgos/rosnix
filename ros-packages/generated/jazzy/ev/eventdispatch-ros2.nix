{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  eventdispatch-python,
  eventdispatch-ros2-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "eventdispatch_ros2";
  version = "0.2.26-1";
  src = finalAttrs.passthru.sources."eventdispatch_ros2";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ eventdispatch-python eventdispatch-ros2-interfaces rclcpp rclpy ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ eventdispatch-python eventdispatch-ros2-interfaces rclcpp rclpy ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "eventdispatch_ros2" = substituteSource {
      src = fetchgit {
        name = "eventdispatch_ros2-source";
        url = "https://github.com/ros2-gbp/ros2_eventdispatch-release.git";
        rev = "5a7f36c69b0642a999dc482fa2ab798454e38cf7";
        hash = "sha256-/iI/GkHd3yrobofSU3KPrby6iFB9xDIJKNCa/SgXsPI=";
      };
    };
  });
  meta = {
    description = "ROS2 wrapper for python-eventdispatch";
  };
})
