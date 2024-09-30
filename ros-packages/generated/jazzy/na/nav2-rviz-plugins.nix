{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-lifecycle-manager,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  resource-retriever,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz-ogre-vendor,
  rviz-rendering,
  std-msgs,
  substituteSource,
  tf2-geometry-msgs,
  urdf,
  visualization-msgs,
  wrapRosQtAppsHook,
  yaml-cpp-vendor,
}:
let
  sources = mkSourceSet (sources: {
    "nav2_rviz_plugins" = substituteSource {
      src = fetchgit {
        name = "nav2_rviz_plugins-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "6fa0a928c11367965d18de1db92dd32764729b15";
        hash = "sha256-xPI0IwHmylfSWm036ptYq2DFSUosgFvONkgJ9/LNCPA=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "nav2_rviz_plugins";
  version = "1.3.2-1";
  src = sources."nav2_rviz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs nav2-lifecycle-manager nav2-msgs nav2-util nav-msgs pluginlib rclcpp rclcpp-lifecycle resource-retriever rviz-common rviz-default-plugins rviz-ogre-vendor rviz-rendering std-msgs tf2-geometry-msgs urdf visualization-msgs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Navigation 2 plugins for rviz";
  };
}
