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
  diagnostic_msgs,
  diagnostic_updater,
  eigen3_cmake_module,
  eigen_stl_containers,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  geometry_msgs,
  libmavconn,
  mavlink,
  mavros_msgs,
  message_filters,
  mkSourceSet,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_components,
  rclpy,
  rcpputils,
  rosSystemPackages,
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
  sources = mkSourceSet (sources: {
    "mavros" = substituteSource {
      src = fetchgit {
        name = "mavros-source";
        url = "https://github.com/ros2-gbp/mavros-release.git";
        rev = "31d2090fed1e28a8a3d6eeb570bce12ea0bbf072";
        hash = "sha256-45ZIQJFqpxq+2FRWIxmsJn9gNb+VUMlu7A951/VcfjE=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "mavros";
  version = "2.8.0-1";
  src = sources."mavros";
  nativeBuildInputs = [ ament_cmake ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ eigen3_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles diagnostic_msgs diagnostic_updater eigen_stl_containers geographic_msgs geometry_msgs libmavconn mavlink mavros_msgs message_filters nav_msgs pluginlib rclcpp rclcpp_components rclpy rcpputils rosidl_default_runtime sensor_msgs std_msgs std_srvs tf2_eigen tf2_ros trajectory_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "geographiclib" "geographiclib-tools" "libconsole-bridge-dev" "python3-click" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "google-mock" "gtest" ]; };
  meta = {
    description = "MAVROS -- MAVLink extendable communication node for ROS with proxy for Ground Control Station.";
  };
}
