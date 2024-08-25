{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
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
        rev = "fdbc5a063b5e0da04cd63e5ab02fcb532c50480f";
        hash = "sha256-UpVltx90Zs+hG14UO4EYeYQya0S+VF8vf/DQ0nbMFTk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_common";
  version = "14.2.5-1";
  src = sources.rviz_common;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs message_filters pluginlib qt5.qtbase qt5.qtsvg rclcpp resource_retriever rviz_ogre_vendor rviz_rendering sensor_msgs std_msgs std_srvs tf2 tf2_ros tinyxml2_vendor urdf yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [ "libqt5-svg" ];
  meta = {
    description = "Common rviz API, used by rviz plugins and applications.";
  };
}
