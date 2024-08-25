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
  nav_msgs,
  pcl_conversions,
  pcl_ros,
  pluginlib,
  rclcpp,
  rclcpp_components,
  rtabmap_conversions,
  rtabmap_msgs,
  rtabmap_sync,
  rtabmap_util,
  sensor_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rtabmap_odom = substituteSource {
      src = fetchgit {
        name = "rtabmap_odom-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "8228b4545c1f1bd89b35e75b76bd67e652811627";
        hash = "sha256-0owvQSXMQlE+Y8M0UBrrHLvgxACHLwndNVXcFYqLy+Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap_odom";
  version = "0.21.5-3";
  src = sources.rtabmap_odom;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_geometry laser_geometry message_filters nav_msgs pcl_conversions pcl_ros pluginlib rclcpp rclcpp_components rtabmap_conversions rtabmap_msgs rtabmap_sync rtabmap_util sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "RTAB-Map's odometry package.";
  };
}
