{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_graceful_controller,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  opennav_docking_core,
  pluginlib,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
  tf2_ros,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    opennav_docking-06c983c12bf21fa2ecf378ea2c66d3a7c7146e4b = substituteSource {
      src = fetchgit {
        name = "opennav_docking-06c983c12bf21fa2ecf378ea2c66d3a7c7146e4b-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "06c983c12bf21fa2ecf378ea2c66d3a7c7146e4b";
        hash = "sha256-oYMQqBvVgM5FLPZFrKDxNjYTFDJdTanndgsarscpmRQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "opennav_docking";
  version = "1.3.2-1";
  src = sources.opennav_docking-06c983c12bf21fa2ecf378ea2c66d3a7c7146e4b;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles builtin_interfaces geometry_msgs nav2_graceful_controller nav2_msgs nav2_util nav_msgs opennav_docking_core pluginlib rclcpp rclcpp_action rclcpp_lifecycle sensor_msgs tf2_ros yaml_cpp_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A Task Server for robot charger docking";
  };
}
