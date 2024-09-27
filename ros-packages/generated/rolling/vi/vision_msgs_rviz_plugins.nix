{
  ament_cmake,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclpy,
  rosSystemPackages,
  rviz2,
  rviz_common,
  rviz_default_plugins,
  rviz_rendering,
  substituteSource,
  vision_msgs,
  wrapRosQtAppsHook,
  yaml_cpp_vendor,
}:
let
  sources = mkSourceSet (sources: {
    "vision_msgs_rviz_plugins" = substituteSource {
      src = fetchgit {
        name = "vision_msgs_rviz_plugins-source";
        url = "https://github.com/ros2-gbp/vision_msgs-release.git";
        rev = "e8120da5536fc03f24cae5c068d4c4be1b5cd30d";
        hash = "sha256-If7mQ5EP7ZLB2EDPnUwciKX0dBfJa4PjuLnUH/ThGjM=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "vision_msgs_rviz_plugins";
  version = "4.1.1-2";
  src = sources."vision_msgs_rviz_plugins";
  nativeBuildInputs = [ ament_cmake ament_cmake_python wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pluginlib rclcpp rclpy rviz2 rviz_common rviz_default_plugins rviz_rendering vision_msgs yaml_cpp_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RVIZ2 plugins for visualizing vision_msgs";
  };
}
