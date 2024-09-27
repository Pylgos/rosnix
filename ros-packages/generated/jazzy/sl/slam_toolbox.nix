{
  ament_cmake,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_gtest,
  ament_cmake_uncrustify,
  ament_lint_auto,
  bond,
  bondcpp,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  interactive_markers,
  launch,
  launch_testing,
  lifecycle_msgs,
  message_filters,
  mkSourceSet,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  rosSystemPackages,
  rosidl_default_generators,
  rviz_common,
  rviz_default_plugins,
  rviz_ogre_vendor,
  rviz_rendering,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  tf2_sensor_msgs,
  visualization_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "slam_toolbox" = substituteSource {
      src = fetchgit {
        name = "slam_toolbox-source";
        url = "https://github.com/SteveMacenski/slam_toolbox-release.git";
        rev = "1e73a216a61722acd0b77d7ef25759db4b183dc4";
        hash = "sha256-XuG5qBercHsZopAr/jEnaSer+0FrgZ0DhIdnHt+thkE=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "slam_toolbox";
  version = "2.8.1-2";
  src = sources."slam_toolbox";
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ bond bondcpp builtin_interfaces interactive_markers lifecycle_msgs message_filters nav_msgs pluginlib rclcpp rclcpp_lifecycle rviz_common rviz_default_plugins rviz_ogre_vendor rviz_rendering sensor_msgs std_msgs std_srvs tf2 tf2_geometry_msgs tf2_ros tf2_sensor_msgs visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "libceres-dev" "liblapack-dev" "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" "suitesparse" "tbb" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_cpplint ament_cmake_flake8 ament_cmake_gtest ament_cmake_uncrustify ament_lint_auto launch launch_testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package provides a sped up improved slam karto with updated SDK and visualization and modification toolsets";
  };
}
