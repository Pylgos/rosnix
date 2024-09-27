{
  ament_cmake,
  ament_cmake_uncrustify,
  buildRosPackage,
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
    rmf_visualization_rviz2_plugins-9a7eceb61b5bd2392a1de185444c296fdd0367ef = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_rviz2_plugins-9a7eceb61b5bd2392a1de185444c296fdd0367ef-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "9a7eceb61b5bd2392a1de185444c296fdd0367ef";
        hash = "sha256-78UcowH8vd7u+XTow2CjJX5qqrGQXJvp9DEroXxS0ZY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_rviz2_plugins";
  version = "2.4.0-1";
  src = sources.rmf_visualization_rviz2_plugins-9a7eceb61b5bd2392a1de185444c296fdd0367ef;
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
