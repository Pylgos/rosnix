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
    mrpt_sensor_gnss_novatel = substituteSource {
      src = fetchgit {
        name = "mrpt_sensor_gnss_novatel-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "479838fcf32f37be59a42a1e8a025f3dda0ffc5d";
        hash = "sha256-a+Dr6zLT/8aT1Es2/Z+1frdq7qfMXe/ogHp5XRpXhgg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_sensor_gnss_novatel";
  version = "0.2.3-1";
  src = sources.mrpt_sensor_gnss_novatel;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge geometry_msgs mrpt_libhwdrivers mrpt_libros_bridge mrpt_msgs mrpt_sensorlib nav_msgs rclcpp rclcpp_components sensor_msgs std_msgs stereo_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ROS node for GNSS/IMU Novatel receivers with RTK precision using an NTRIP HTTP source (based on mrpt-hwdrivers)";
  };
}
