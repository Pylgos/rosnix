{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
  tf2_geometry_msgs,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    imu_filter_madgwick = substituteSource {
      src = fetchgit {
        name = "imu_filter_madgwick-source";
        url = "https://github.com/ros2-gbp/imu_tools-release.git";
        rev = "7ee0d1935761f893a2886fa63bab087357798c86";
        hash = "sha256-9xtHq3mg21RtWQYIhMsY0cbBWAiBh4WzSO3jZvFDaJc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "imu_filter_madgwick";
  version = "2.1.4-1";
  src = sources.imu_filter_madgwick;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs nav_msgs rclcpp rclcpp_action rclcpp_lifecycle sensor_msgs tf2_geometry_msgs tf2_ros visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Filter which fuses angular velocities, accelerations, and (optionally) magnetic readings from a generic IMU device into an orientation. Based on code by Sebastian Madgwick, http://www.x-io.co.uk/node/8#open_source_ahrs_and_imu_algorithms.";
  };
}
