{
  ament_cmake_gtest,
  ament_cpplint,
  buildRosPackage,
  curl,
  diagnostic_aggregator,
  diagnostic_updater,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geographiclib,
  geometry_msgs,
  git,
  jq,
  lifecycle_msgs,
  microstrain_inertial_msgs,
  nav_msgs,
  nmea_msgs,
  rclcpp_lifecycle,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  rtcm_msgs,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    microstrain_inertial_driver = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_driver-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "2a8e8a4f6c2870f11e6c826e72a19efc0c0f0b30";
        hash = "sha256-X29UZFDfi/zZxdj6lxfQRxhsXTZv1yBdjg0x98wbD/Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "microstrain_inertial_driver";
  version = "4.3.0-1";
  src = sources.microstrain_inertial_driver;
  nativeBuildInputs = [ git rosidl_default_generators ];
  propagatedNativeBuildInputs = [ curl eigen ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_aggregator diagnostic_updater geographiclib geometry_msgs jq lifecycle_msgs microstrain_inertial_msgs nav_msgs nmea_msgs rclcpp_lifecycle rosidl_default_runtime rtcm_msgs sensor_msgs std_msgs std_srvs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cpplint ];
  missingDependencies = [  ];
  meta = {
    description = "The ros_mscl package provides a driver for the LORD/Microstrain inertial products.";
  };
}
