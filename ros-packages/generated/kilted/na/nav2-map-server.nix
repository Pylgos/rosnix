{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  launch-testing,
  lifecycle-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-msgs,
  nav2-util,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_map_server";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."nav2_map_server";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ launch-ros launch-testing lifecycle-msgs nav2-common nav2-msgs nav2-util nav-msgs rclcpp rclcpp-lifecycle std-msgs tf2 yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "graphicsmagick" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch-ros launch-testing lifecycle-msgs nav2-common nav2-msgs nav2-util nav-msgs rclcpp rclcpp-lifecycle std-msgs tf2 yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "graphicsmagick" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_map_server" = substituteSource {
      src = fetchgit {
        name = "nav2_map_server-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "2d7d01bbd6c4713b866590a69b2f17cb0ef1cf4d";
        hash = "sha256-fIy6vhu+VJt7J3rCHLygE2HNtYnA/Ud6POR7shqKDoE=";
      };
    };
  });
  meta = {
    description = "\n    Refactored map server for ROS2 Navigation\n  ";
  };
})
