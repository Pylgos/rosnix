{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  message_filters,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  rviz_common,
  rviz_ogre_vendor,
  rviz_rendering,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rviz_imu_plugin-dd8a1409694c079020a74626ea01d42353ed6a54 = substituteSource {
      src = fetchgit {
        name = "rviz_imu_plugin-dd8a1409694c079020a74626ea01d42353ed6a54-source";
        url = "https://github.com/ros2-gbp/imu_tools-release.git";
        rev = "dd8a1409694c079020a74626ea01d42353ed6a54";
        hash = "sha256-Ve4ClRA+kkXcWgIqaDhQOlKTrTYODFV3aGvhCMk/jXM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_imu_plugin";
  version = "2.1.4-1";
  src = sources.rviz_imu_plugin-dd8a1409694c079020a74626ea01d42353ed6a54;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ message_filters pluginlib rclcpp rviz_common rviz_ogre_vendor rviz_rendering sensor_msgs tf2 tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RVIZ plugin for IMU visualization";
  };
}
