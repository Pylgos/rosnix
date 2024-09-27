{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  octomap_msgs,
  rclcpp,
  rosSystemPackages,
  rviz_common,
  rviz_default_plugins,
  rviz_rendering,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    octomap_rviz_plugins = substituteSource {
      src = fetchgit {
        name = "octomap_rviz_plugins-source";
        url = "https://github.com/ros2-gbp/octomap_rviz_plugins-release.git";
        rev = "8dadcae1b5f69dd2291df40df5f949fb0a62b3b0";
        hash = "sha256-jYZZwVA/LByiBlY+KXs0ETYwsDlvq8yjFj31QoHrvM0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "octomap_rviz_plugins";
  version = "2.1.0-1";
  src = sources.octomap_rviz_plugins;
  nativeBuildInputs = [ ament_cmake_auto wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ octomap_msgs rclcpp rviz_common rviz_default_plugins rviz_rendering ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liboctomap-dev" "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A set of plugins for displaying occupancy information decoded from binary octomap messages.";
  };
}
