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
  rclcpp,
  resource_retriever,
  rosSystemPackages,
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
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs message_filters pluginlib rclcpp resource_retriever rviz_ogre_vendor rviz_rendering sensor_msgs std_msgs std_srvs tf2 tf2_ros tinyxml2_vendor urdf yaml_cpp_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-svg" "libqt5-svg-dev" "libqt5-widgets" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_gmock ament_cmake_gtest ament_cmake_lint_cmake ament_cmake_uncrustify ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Common rviz API, used by rviz plugins and applications.";
  };
}
