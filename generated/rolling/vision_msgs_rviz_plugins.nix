{
  ament_cmake,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  python3Packages,
  rclcpp,
  rclpy,
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
  sources = rec {
    vision_msgs_rviz_plugins = substituteSource {
      src = fetchgit {
        name = "vision_msgs_rviz_plugins-source";
        url = "https://github.com/ros2-gbp/vision_msgs-release.git";
        rev = "e8120da5536fc03f24cae5c068d4c4be1b5cd30d";
        hash = "sha256-If7mQ5EP7ZLB2EDPnUwciKX0dBfJa4PjuLnUH/ThGjM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vision_msgs_rviz_plugins";
  version = "4.1.1-2";
  src = sources.vision_msgs_rviz_plugins;
  nativeBuildInputs = [ ament_cmake ament_cmake_python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib python3Packages.numpy rclcpp rclpy rviz2 rviz_common rviz_default_plugins rviz_rendering vision_msgs yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "RVIZ2 plugins for visualizing vision_msgs";
  };
}
