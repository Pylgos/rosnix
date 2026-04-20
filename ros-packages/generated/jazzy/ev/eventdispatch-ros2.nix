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
  version = "0.2.29-1";
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
        rev = "32e32bce2dbebd95062f6cae7ff8d1dfd7117e99";
        hash = "sha256-mY8Z+jypCENl8/VHTXV+rV2oFOmNb8LI5ZhbiT1uG3s=";
      };
    };
  });
  meta = {
    description = "ROS2 wrapper for python-eventdispatch";
  };
})
