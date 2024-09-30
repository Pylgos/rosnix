{
  ament-cmake,
  ament-cmake-uncrustify,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  resource-retriever,
  rmf-door-msgs,
  rmf-lift-msgs,
  rmf-traffic-ros2,
  rmf-utils,
  rmf-visualization-msgs,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz-rendering,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "rmf_visualization_rviz2_plugins" = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_rviz2_plugins-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "9a7eceb61b5bd2392a1de185444c296fdd0367ef";
        hash = "sha256-78UcowH8vd7u+XTow2CjJX5qqrGQXJvp9DEroXxS0ZY=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rmf_visualization_rviz2_plugins";
  version = "2.4.0-1";
  src = sources."rmf_visualization_rviz2_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pluginlib rclcpp resource-retriever rmf-door-msgs rmf-lift-msgs rmf-traffic-ros2 rmf-visualization-msgs rviz-common rviz-default-plugins rviz-rendering ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-uncrustify rmf-utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing RViz2 plugins for RMF";
  };
}
