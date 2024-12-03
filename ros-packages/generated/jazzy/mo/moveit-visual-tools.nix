{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  graph-msgs,
  mkSourceSet,
  moveit-common,
  moveit-core,
  moveit-ros-planning,
  rclcpp,
  rosSystemPackages,
  rviz-visual-tools,
  std-msgs,
  substituteSource,
  tf2-eigen,
  tf2-ros,
  trajectory-msgs,
  visualization-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_visual_tools";
  version = "4.1.1-1";
  src = finalAttrs.passthru.sources."moveit_visual_tools";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ geometry-msgs graph-msgs moveit-common moveit-core moveit-ros-planning rclcpp rviz-visual-tools std-msgs tf2-eigen tf2-ros trajectory-msgs visualization-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_visual_tools" = substituteSource {
      src = fetchgit {
        name = "moveit_visual_tools-source";
        url = "https://github.com/ros2-gbp/moveit_visual_tools-release.git";
        rev = "5165405896d807cda23797670d478d9a5118751e";
        hash = "sha256-Wt4dV+I7vmFHZ3rqHaflsS8+NoLUhyL0NNUX1/ZAAW0=";
      };
    };
  });
  meta = {
    description = "Helper functions for displaying and debugging MoveIt data in Rviz via published markers";
  };
})
