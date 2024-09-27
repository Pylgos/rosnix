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
  rosSystemPackages,
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
    mrpt_sensor_gnss_nmea-bad2e14e8055bcc1b24cf7af43d984f5e2b75d19 = substituteSource {
      src = fetchgit {
        name = "mrpt_sensor_gnss_nmea-bad2e14e8055bcc1b24cf7af43d984f5e2b75d19-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "bad2e14e8055bcc1b24cf7af43d984f5e2b75d19";
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
  src = sources.mrpt_sensor_gnss_nmea-bad2e14e8055bcc1b24cf7af43d984f5e2b75d19;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge geometry_msgs mrpt_libhwdrivers mrpt_libros_bridge mrpt_msgs mrpt_sensorlib nav_msgs nmea_msgs rclcpp rclcpp_components sensor_msgs std_msgs stereo_msgs tf2 tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS node for GNSS receivers generating NMEA messages (based on mrpt-hwdrivers)";
  };
}
