{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "moveit_visual_tools" = substituteSource {
      src = fetchgit {
        name = "moveit_visual_tools-source";
        url = "https://github.com/ros2-gbp/moveit_visual_tools-release.git";
        rev = "15653a26d06fb4725cdd4ec2626caa895586e876";
        hash = "sha256-OsgJs0kV7m3GzRlDL1x8i5hG03piwA+9f+Mbpx+dOmw=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "moveit_visual_tools";
  version = "4.1.0-3";
  src = sources."moveit_visual_tools";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs graph-msgs moveit-common moveit-core moveit-ros-planning rclcpp rviz-visual-tools std-msgs tf2-eigen tf2-ros trajectory-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Helper functions for displaying and debugging MoveIt data in Rviz via published markers";
  };
}
