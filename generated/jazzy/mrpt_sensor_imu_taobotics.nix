{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mrpt_libhwdrivers,
  mrpt_libros_bridge,
  mrpt_msgs,
  mrpt_sensorlib,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  ros_environment,
  sensor_msgs,
  std_msgs,
  stereo_msgs,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    mrpt_sensor_imu_taobotics = substituteSource {
      src = fetchgit {
        name = "mrpt_sensor_imu_taobotics-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "b503c4a001f57759bf900f5a9ff6c3f190dbbb38";
        hash = "sha256-i/VI6NybgOTVnmZO3RoHSnA7Gbjea8iGtqnuJ2+MjmQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_sensor_imu_taobotics";
  version = "0.2.3-1";
  src = sources.mrpt_sensor_imu_taobotics;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge geometry_msgs mrpt_libhwdrivers mrpt_libros_bridge mrpt_msgs mrpt_sensorlib nav_msgs rclcpp rclcpp_components sensor_msgs std_msgs stereo_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ROS node for Taobotics USB IMUs (based on mrpt-hwdrivers)";
  };
}
