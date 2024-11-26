{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  interactive-markers,
  mkSourceSet,
  moveit-common,
  moveit-core,
  moveit-ros-planning,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_ros_robot_interaction";
  version = "2.10.0-1";
  src = finalAttrs.passthru.sources."moveit_ros_robot_interaction";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ interactive-markers moveit-common moveit-core moveit-ros-planning rclcpp tf2 tf2-eigen tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ];
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_ros_robot_interaction" = substituteSource {
        src = fetchgit {
          name = "moveit_ros_robot_interaction-source";
          url = "https://github.com/ros2-gbp/moveit2-release.git";
          rev = "ddb05e33043712ce2b4d9f1fd8baaf8fbf7e494f";
          hash = "sha256-z8r+vWJe9V5E0HFgvUdAPpSxQN4woZl0l/ec5guTiDo=";
        };
      };
    });
  };
  meta = {
    description = "Components of MoveIt that offer interaction via interactive markers";
  };
})
