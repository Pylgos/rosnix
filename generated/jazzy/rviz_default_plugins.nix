{
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_lint_cmake,
  ament_cmake_ros,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_index_cpp,
  ament_lint_auto,
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
  nav_msgs,
  pluginlib,
  point_cloud_transport,
  qt5,
  rclcpp,
  resource_retriever,
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
  sources = rec {
    rviz_default_plugins = substituteSource {
      src = fetchgit {
        name = "rviz_default_plugins-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "4bc5c17478b525f50d179cdf7234eb81eab419eb";
        hash = "sha256-6kgrLp+VYgqdRHFaiwjVMQqNC5P5Pxowv1ep152UMow=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_default_plugins";
  version = "14.1.5-1";
  src = sources.rviz_default_plugins;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs gz_math_vendor image_transport interactive_markers laser_geometry map_msgs nav_msgs pluginlib point_cloud_transport qt5.qtbase rclcpp resource_retriever rviz_common rviz_ogre_vendor rviz_rendering tf2 tf2_geometry_msgs tf2_ros urdf visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_gmock ament_cmake_gtest ament_cmake_lint_cmake ament_cmake_uncrustify ament_cmake_xmllint ament_index_cpp ament_lint_auto rviz_rendering_tests rviz_visual_testing_framework ];
  missingDependencies = [  ];
  meta = {
    description = "Several default plugins for rviz to cover the basic functionality.";
  };
}
