{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-common,
  moveit-configs-utils,
  moveit-core,
  moveit-planners-chomp,
  moveit-planners-ompl,
  moveit-planners-stomp,
  moveit-resources-panda-moveit-config,
  moveit-ros-move-group,
  moveit-ros-planning,
  moveit-ros-planning-interface,
  moveit-simple-controller-manager,
  pilz-industrial-motion-planner,
  rclcpp,
  ros-testing,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_ros_tests";
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."moveit_ros_tests";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-common rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto moveit-configs-utils moveit-core moveit-planners-chomp moveit-planners-ompl moveit-planners-stomp moveit-resources-panda-moveit-config moveit-ros-move-group moveit-ros-planning moveit-ros-planning-interface moveit-simple-controller-manager pilz-industrial-motion-planner ros-testing tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_tests" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_tests-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "f73f3bd18a7d49b540f95167a3dbf420a3749704";
        hash = "sha256-nOP0yphk9U+nDSwHsQYtzvNGQeI3ZJoQTvt1tCT/3pg=";
      };
    };
  });
  meta = {
    description = "Integration tests for moveit_ros";
  };
})
