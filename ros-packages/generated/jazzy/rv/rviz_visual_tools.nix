{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen3_cmake_module,
  eigen_stl_containers,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  interactive_markers,
  launch,
  launch_ros,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  rviz2,
  rviz_common,
  rviz_default_plugins,
  rviz_ogre_vendor,
  rviz_rendering,
  sensor_msgs,
  shape_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  trajectory_msgs,
  visualization_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "rviz_visual_tools" = substituteSource {
      src = fetchgit {
        name = "rviz_visual_tools-source";
        url = "https://github.com/ros2-gbp/rviz_visual_tools-release.git";
        rev = "2e05b97387c407ea702931822cc02c3f29dea126";
        hash = "sha256-tVfPKQNpM962nm3D4nPbalanEed98pZ6A4v4ySC79yI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rviz_visual_tools";
  version = "4.1.4-4";
  src = sources."rviz_visual_tools";
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ eigen3_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python eigen_stl_containers geometry_msgs interactive_markers launch launch_ros pluginlib rclcpp rclcpp_components rviz2 rviz_common rviz_default_plugins rviz_ogre_vendor rviz_rendering sensor_msgs shape_msgs std_msgs tf2 tf2_eigen tf2_geometry_msgs trajectory_msgs visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libqt5-widgets" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Utility functions for displaying and debugging data in Rviz via published markers";
  };
}
