{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_lifecycle_manager,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  pluginlib,
  qt5,
  rclcpp,
  rclcpp_lifecycle,
  resource_retriever,
  rviz_common,
  rviz_default_plugins,
  rviz_ogre_vendor,
  rviz_rendering,
  std_msgs,
  substituteSource,
  tf2_geometry_msgs,
  urdf,
  visualization_msgs,
  wrapRosQtAppsHook,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    nav2_rviz_plugins = substituteSource {
      src = fetchgit {
        name = "nav2_rviz_plugins-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "6fa0a928c11367965d18de1db92dd32764729b15";
        hash = "sha256-xPI0IwHmylfSWm036ptYq2DFSUosgFvONkgJ9/LNCPA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_rviz_plugins";
  version = "1.3.2-1";
  src = sources.nav2_rviz_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav2_lifecycle_manager nav2_msgs nav2_util nav_msgs pluginlib qt5.qtbase rclcpp rclcpp_lifecycle resource_retriever rviz_common rviz_default_plugins rviz_ogre_vendor rviz_rendering std_msgs tf2_geometry_msgs urdf visualization_msgs yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Navigation 2 plugins for rviz";
  };
}
