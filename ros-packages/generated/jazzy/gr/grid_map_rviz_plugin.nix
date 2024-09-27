{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  grid_map_cmake_helpers,
  grid_map_msgs,
  grid_map_ros,
  rclcpp,
  rosSystemPackages,
  rviz_common,
  rviz_ogre_vendor,
  rviz_rendering,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    grid_map_rviz_plugin-b347fa11e021fd9fc2e74c93f3e58ef9080afc72 = substituteSource {
      src = fetchgit {
        name = "grid_map_rviz_plugin-b347fa11e021fd9fc2e74c93f3e58ef9080afc72-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "b347fa11e021fd9fc2e74c93f3e58ef9080afc72";
        hash = "sha256-DAioUw7W4LJs4Pt/ZYANnFiCDBerU3Rbnk7Ql3LEq7w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_rviz_plugin";
  version = "2.2.0-1";
  src = sources.grid_map_rviz_plugin-b347fa11e021fd9fc2e74c93f3e58ef9080afc72;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ grid_map_cmake_helpers grid_map_msgs grid_map_ros rclcpp rviz_common rviz_ogre_vendor rviz_rendering ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RViz plugin for displaying grid map messages.";
  };
}
