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
  sources = rec {
    vision_msgs_rviz_plugins-ebb9be37660ba670afd284336523d0de9dd2d0ee = substituteSource {
      src = fetchgit {
        name = "vision_msgs_rviz_plugins-ebb9be37660ba670afd284336523d0de9dd2d0ee-source";
        url = "https://github.com/ros2-gbp/vision_msgs-release.git";
        rev = "ebb9be37660ba670afd284336523d0de9dd2d0ee";
        hash = "sha256-If7mQ5EP7ZLB2EDPnUwciKX0dBfJa4PjuLnUH/ThGjM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vision_msgs_rviz_plugins";
  version = "4.1.1-3";
  src = sources.vision_msgs_rviz_plugins-ebb9be37660ba670afd284336523d0de9dd2d0ee;
  nativeBuildInputs = [ ament_cmake ament_cmake_python wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pluginlib rclcpp rclpy rviz2 rviz_common rviz_default_plugins rviz_rendering vision_msgs yaml_cpp_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RVIZ2 plugins for visualizing vision_msgs";
  };
}
