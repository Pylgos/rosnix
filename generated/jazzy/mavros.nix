{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  console-bridge,
  diagnostic_msgs,
  diagnostic_updater,
  eigen,
  eigen3_cmake_module,
  eigen_stl_containers,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  geographiclib,
  geometry_msgs,
  gtest,
  libmavconn,
  mavlink,
  mavros_msgs,
  message_filters,
  nav_msgs,
  pluginlib,
  python3Packages,
  rclcpp,
  rclcpp_components,
  rclpy,
  rcpputils,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_eigen,
  tf2_ros,
  trajectory_msgs,
}:
let
  sources = rec {
    mavros = substituteSource {
      src = fetchgit {
        name = "mavros-source";
        url = "https://github.com/ros2-gbp/mavros-release.git";
        rev = "31d2090fed1e28a8a3d6eeb570bce12ea0bbf072";
        hash = "sha256-45ZIQJFqpxq+2FRWIxmsJn9gNb+VUMlu7A951/VcfjE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mavros";
  version = "2.8.0-1";
  src = sources.mavros;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [ eigen eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles console-bridge diagnostic_msgs diagnostic_updater eigen_stl_containers geographic_msgs geographiclib geometry_msgs libmavconn mavlink mavros_msgs message_filters nav_msgs pluginlib python3Packages.click rclcpp rclcpp_components rclpy rcpputils rosidl_default_runtime sensor_msgs std_msgs std_srvs tf2_eigen tf2_ros trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common gtest ];
  missingDependencies = [ "geographiclib-tools" ];
  meta = {
    description = "MAVROS -- MAVLink extendable communication node for ROS with proxy for Ground Control Station.";
  };
}
