{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclpy,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz-rendering,
  rviz2,
  substituteSource,
  vision-msgs,
  wrapRosQtAppsHook,
  yaml-cpp-vendor,
}:
let
  sources = mkSourceSet (sources: {
    "vision_msgs_rviz_plugins" = substituteSource {
      src = fetchgit {
        name = "vision_msgs_rviz_plugins-source";
        url = "https://github.com/ros2-gbp/vision_msgs-release.git";
        rev = "ebb9be37660ba670afd284336523d0de9dd2d0ee";
        hash = "sha256-If7mQ5EP7ZLB2EDPnUwciKX0dBfJa4PjuLnUH/ThGjM=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "vision_msgs_rviz_plugins";
  version = "4.1.1-3";
  src = sources."vision_msgs_rviz_plugins";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pluginlib rclcpp rclpy rviz2 rviz-common rviz-default-plugins rviz-rendering vision-msgs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RVIZ2 plugins for visualizing vision_msgs";
  };
}
