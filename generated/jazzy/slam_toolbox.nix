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
  ceres-solver,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  interactive_markers,
  launch,
  launch_testing,
  liblapack,
  lifecycle_msgs,
  message_filters,
  nav_msgs,
  pluginlib,
  python3Packages,
  qt5,
  rclcpp,
  rclcpp_lifecycle,
  rosidl_default_generators,
  rviz_common,
  rviz_default_plugins,
  rviz_ogre_vendor,
  rviz_rendering,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  suitesparse,
  tbb,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  tf2_sensor_msgs,
  visualization_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    slam_toolbox = substituteSource {
      src = fetchgit {
        name = "slam_toolbox-source";
        url = "https://github.com/SteveMacenski/slam_toolbox-release.git";
        rev = "1e73a216a61722acd0b77d7ef25759db4b183dc4";
        hash = "sha256-XuG5qBercHsZopAr/jEnaSer+0FrgZ0DhIdnHt+thkE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "slam_toolbox";
  version = "2.8.1-2";
  src = sources.slam_toolbox;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bond bondcpp builtin_interfaces ceres-solver eigen interactive_markers liblapack lifecycle_msgs message_filters nav_msgs pluginlib python3Packages.boost qt5.qtbase rclcpp rclcpp_lifecycle rviz_common rviz_default_plugins rviz_ogre_vendor rviz_rendering sensor_msgs std_msgs std_srvs suitesparse tbb tf2 tf2_geometry_msgs tf2_ros tf2_sensor_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_cpplint ament_cmake_flake8 ament_cmake_gtest ament_cmake_uncrustify ament_lint_auto launch launch_testing ];
  missingDependencies = [  ];
  meta = {
    description = "This package provides a sped up improved slam karto with updated SDK and visualization and modification toolsets";
  };
}
