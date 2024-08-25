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
    mrpt_sensor_bumblebee_stereo = substituteSource {
      src = fetchgit {
        name = "mrpt_sensor_bumblebee_stereo-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "d1403272347e64bfa0bb47579209cd5e0f85899b";
        hash = "sha256-QxRtg7oL8IXcdPoqOOQL/6KvoQGJSgIKkpNQgEe62+g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_sensor_bumblebee_stereo";
  version = "0.2.2-1";
  src = sources.mrpt_sensor_bumblebee_stereo;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mrpt2 mrpt_msgs mrpt_sensorlib rclcpp rclcpp_components tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ROS node for Bumblebee Stereo Cameras using libdc1394 interface (based on mrpt-hwdrivers)";
  };
}
