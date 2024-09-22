{
  ament_cmake,
  ament_cmake_uncrustify,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  rclcpp,
  resource_retriever,
  rmf_door_msgs,
  rmf_lift_msgs,
  rmf_traffic_ros2,
  rmf_utils,
  rmf_visualization_msgs,
  rosSystemPackages,
  rviz_common,
  rviz_default_plugins,
  rviz_rendering,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rmf_visualization_rviz2_plugins = substituteSource {
      src = fetchFromGitHub {
        name = "rmf_visualization_rviz2_plugins-source";
        owner = "ros2-gbp";
        repo = "rmf_visualization-release";
        rev = "6a446a8b53432f788570fd1d75e5004fc5d784a2";
        hash = "sha256-JW8h27nDnZY7HFklphMYJCP/FARy5JqLWMrGFx5R2wY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_rviz2_plugins";
  version = "2.3.2-1";
  src = sources.rmf_visualization_rviz2_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pluginlib rclcpp resource_retriever rmf_door_msgs rmf_lift_msgs rmf_traffic_ros2 rmf_visualization_msgs rviz_common rviz_default_plugins rviz_rendering ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_uncrustify rmf_utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing RViz2 plugins for RMF";
  };
}
