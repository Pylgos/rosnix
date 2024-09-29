{
  ament_cmake_ros,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_geometry,
  laser_geometry,
  message_filters,
  mkSourceSet,
  nav_msgs,
  pcl_conversions,
  pcl_ros,
  pluginlib,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  rtabmap_conversions,
  rtabmap_msgs,
  rtabmap_sync,
  rtabmap_util,
  sensor_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "rtabmap_odom" = substituteSource {
      src = fetchgit {
        name = "rtabmap_odom-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "8228b4545c1f1bd89b35e75b76bd67e652811627";
        hash = "sha256-0owvQSXMQlE+Y8M0UBrrHLvgxACHLwndNVXcFYqLy+Q=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rtabmap_odom";
  version = "0.21.5-3";
  src = sources."rtabmap_odom";
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge image_geometry laser_geometry message_filters nav_msgs pcl_conversions pcl_ros pluginlib rclcpp rclcpp_components rtabmap_conversions rtabmap_msgs rtabmap_sync rtabmap_util sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RTAB-Map's odometry package.";
  };
}