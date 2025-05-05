{
  ament-cmake,
  ament-cmake-pytest,
  ament-cmake-uncrustify,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch-pytest,
  launch-testing-ament-cmake,
  mkSourceSet,
  moveit-common,
  moveit-configs-utils,
  moveit-planners-ompl,
  moveit-resources,
  moveit-ros,
  moveit-ros-planning-interface,
  rclcpp,
  rclcpp-action,
  rmf-utils,
  robot-state-publisher,
  ros2-control,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
  trajectory-msgs,
  warehouse-ros-sqlite,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_ros_trajectory_cache";
  version = "2.12.3-1";
  src = finalAttrs.passthru.sources."moveit_ros_trajectory_cache";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ geometry-msgs moveit-common moveit-ros moveit-ros-planning-interface rclcpp-action tf2-ros trajectory-msgs xacro ];
  checkInputs = [ ament-cmake-pytest ament-cmake-uncrustify launch-pytest launch-testing-ament-cmake moveit-configs-utils moveit-planners-ompl moveit-resources rmf-utils robot-state-publisher ros2-control warehouse-ros-sqlite ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_trajectory_cache" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_trajectory_cache-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "290747507bb3bd9d7790bc4f597580636b507524";
        hash = "sha256-QQ/7e7nv74kFyqrOA2kL5/m9JgyRaTBQtglTPvhI0HY=";
      };
    };
  });
  meta = {
    description = "A trajectory cache for MoveIt 2 motion plans and cartesian plans.";
  };
})
