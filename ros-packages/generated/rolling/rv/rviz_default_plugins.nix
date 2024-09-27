{
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_lint_cmake,
  ament_cmake_ros,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  gz_math_vendor,
  image_transport,
  interactive_markers,
  laser_geometry,
  map_msgs,
  mkSourceSet,
  nav_msgs,
  pluginlib,
  point_cloud_transport,
  rclcpp,
  resource_retriever,
  rosSystemPackages,
  rviz_common,
  rviz_ogre_vendor,
  rviz_rendering,
  rviz_rendering_tests,
  rviz_visual_testing_framework,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  urdf,
  visualization_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "rviz_default_plugins" = substituteSource {
      src = fetchgit {
        name = "rviz_default_plugins-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "1ac15c09f0cbc59111513a6fc78ac00155681828";
        hash = "sha256-Fryn4lcRiYavvFgGC1OfWU9c1e4Swzc97+u8+bPjzeI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rviz_default_plugins";
  version = "14.2.6-1";
  src = sources."rviz_default_plugins";
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs gz_math_vendor image_transport interactive_markers laser_geometry map_msgs nav_msgs pluginlib point_cloud_transport rclcpp resource_retriever rviz_common rviz_ogre_vendor rviz_rendering tf2 tf2_geometry_msgs tf2_ros urdf visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ament_cmake_lint_cmake ament_index_cpp ament_lint_auto ament_lint_common rviz_rendering_tests rviz_visual_testing_framework ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Several default plugins for rviz to cover the basic functionality.";
  };
}
