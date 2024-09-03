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
  nmea_msgs,
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
    mrpt_sensor_gnss_nmea = substituteSource {
      src = fetchgit {
        name = "mrpt_sensor_gnss_nmea-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "170d5682248d72aa34bf624c2ca7e2f53d39d387";
        hash = "sha256-AZcZeGwHOjz/3QOqQ7+B9U1A1MQLQZJfbvs+EwbBJWw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_sensor_gnss_nmea";
  version = "0.2.3-1";
  src = sources.mrpt_sensor_gnss_nmea;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge geometry_msgs mrpt_libhwdrivers mrpt_libros_bridge mrpt_msgs mrpt_sensorlib nav_msgs nmea_msgs rclcpp rclcpp_components sensor_msgs std_msgs stereo_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ROS node for GNSS receivers generating NMEA messages (based on mrpt-hwdrivers)";
  };
}
