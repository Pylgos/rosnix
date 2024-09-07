{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_lint_cmake,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  message_filters,
  pluginlib,
  qt5,
  rclcpp,
  resource_retriever,
  rviz_ogre_vendor,
  rviz_rendering,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_ros,
  tinyxml2_vendor,
  urdf,
  wrapRosQtAppsHook,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    rviz_common = substituteSource {
      src = fetchgit {
        name = "rviz_common-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "9fd88f0a3f5cb302dab2e517d838ed3be2a48baa";
        hash = "sha256-fGp1rqOTfUrHXDauPt6Z8qQw9eo+gDxovGrFZQDi3Jc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_common";
  version = "14.1.5-1";
  src = sources.rviz_common;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs message_filters pluginlib qt5.qtbase qt5.qtsvg rclcpp resource_retriever rviz_ogre_vendor rviz_rendering sensor_msgs std_msgs std_srvs tf2 tf2_ros tinyxml2_vendor urdf yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_gmock ament_cmake_gtest ament_cmake_lint_cmake ament_cmake_uncrustify ament_cmake_xmllint ament_lint_auto ];
  missingDependencies = [ "libqt5-svg" ];
  meta = {
    description = "Common rviz API, used by rviz plugins and applications.";
  };
}
