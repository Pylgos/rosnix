{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_lifecycle_manager,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  resource_retriever,
  rosSystemPackages,
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
      src = fetchFromGitHub {
        name = "nav2_rviz_plugins-source";
        owner = "SteveMacenski";
        repo = "navigation2-release";
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
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs nav2_lifecycle_manager nav2_msgs nav2_util nav_msgs pluginlib rclcpp rclcpp_lifecycle resource_retriever rviz_common rviz_default_plugins rviz_ogre_vendor rviz_rendering std_msgs tf2_geometry_msgs urdf visualization_msgs yaml_cpp_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Navigation 2 plugins for rviz";
  };
}
