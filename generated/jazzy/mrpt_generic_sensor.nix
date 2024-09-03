{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt_msgs,
  mrpt_sensorlib,
  rclcpp,
  rclcpp_components,
  ros_environment,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    mrpt_generic_sensor = substituteSource {
      src = fetchgit {
        name = "mrpt_generic_sensor-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "99d31fd797f85b5c25a26d38b2de79c9c9258230";
        hash = "sha256-zy7AqmAH8M/rMumF0LopeoC7jzQOPo5Y436ngxwaoxk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_generic_sensor";
  version = "0.2.3-1";
  src = sources.mrpt_generic_sensor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mrpt_msgs mrpt_sensorlib rclcpp rclcpp_components sensor_msgs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ROS node for interfacing any sensor supported by mrpt-hwdrivers";
  };
}
