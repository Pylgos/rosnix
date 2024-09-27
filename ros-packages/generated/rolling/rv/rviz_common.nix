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
    rviz_common-7a644bd54911107ac2929efa5241b3567860b81c = substituteSource {
      src = fetchgit {
        name = "rviz_common-7a644bd54911107ac2929efa5241b3567860b81c-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "7a644bd54911107ac2929efa5241b3567860b81c";
        hash = "sha256-9Awo+33WWPuGBXPj0LttfjpYtGR6/pF9iULo0M4dyxY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_common";
  version = "14.2.6-1";
  src = sources.rviz_common-7a644bd54911107ac2929efa5241b3567860b81c;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs message_filters pluginlib rclcpp resource_retriever rviz_ogre_vendor rviz_rendering sensor_msgs std_msgs std_srvs tf2 tf2_ros tinyxml2_vendor urdf yaml_cpp_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-svg" "libqt5-svg-dev" "libqt5-widgets" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Common rviz API, used by rviz plugins and applications.";
  };
}
