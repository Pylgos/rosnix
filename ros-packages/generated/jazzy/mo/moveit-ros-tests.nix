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
  version = "2.10.0-1";
  src = finalAttrs.passthru.sources."moveit_ros_tests";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-common rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto moveit-configs-utils moveit-core moveit-planners-chomp moveit-planners-ompl moveit-planners-stomp moveit-resources-panda-moveit-config moveit-ros-move-group moveit-ros-planning moveit-ros-planning-interface moveit-simple-controller-manager pilz-industrial-motion-planner ros-testing tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_tests" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_tests-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "0ab7f4dac1d6d69e2d07e83f7f6cd732d42fcee4";
        hash = "sha256-CBtAHgOOSEBQ/Ccgd8mFuMEkvE1S2+T3ZGx0c8fLr+E=";
      };
    };
  });
  meta = {
    description = "Integration tests for moveit_ros";
  };
})
