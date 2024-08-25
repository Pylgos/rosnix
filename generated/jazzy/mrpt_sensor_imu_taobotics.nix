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
    mrpt_sensor_imu_taobotics = substituteSource {
      src = fetchgit {
        name = "mrpt_sensor_imu_taobotics-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "0b7e944f00b2c4e10e5cbab24de60f6d0ebbae76";
        hash = "sha256-Ki8/LWDjBiirJdmkwZmRH1dShZrVVgTwWhVI6dQa4/o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_sensor_imu_taobotics";
  version = "0.2.2-1";
  src = sources.mrpt_sensor_imu_taobotics;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mrpt2 mrpt_msgs mrpt_sensorlib rclcpp rclcpp_components tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ROS node for Taobotics USB IMUs (based on mrpt-hwdrivers)";
  };
}
