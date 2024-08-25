{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt2,
  mrpt_msgs,
  mrpt_sensorlib,
  rclcpp,
  rclcpp_components,
  ros_environment,
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
        rev = "01c2e7613099ab4ae582ba923e52383c2fdc5abd";
        hash = "sha256-he4C/hlbPvgqBkK/K7BcwbyrvHIaGSqsZlMMtxzpEso=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_sensor_gnss_novatel";
  version = "0.2.2-1";
  src = sources.mrpt_sensor_gnss_novatel;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mrpt2 mrpt_msgs mrpt_sensorlib rclcpp rclcpp_components tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ROS node for GNSS/IMU Novatel receivers with RTK precision using an NTRIP HTTP source (based on mrpt-hwdrivers)";
  };
}
