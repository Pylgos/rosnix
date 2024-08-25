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
  sensor_msgs,
  substituteSource,
  tf2_ros,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    opennav_docking = substituteSource {
      src = fetchgit {
        name = "opennav_docking-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "440367280a139530d7367938dea6cfbb43e85df6";
        hash = "sha256-aa/5TrLWsEL5IKvujApGrTkKCcoMbcoYvXo5dCUS+P8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "opennav_docking";
  version = "1.3.1-1";
  src = sources.opennav_docking;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles builtin_interfaces geometry_msgs nav2_graceful_controller nav2_msgs nav2_util nav_msgs opennav_docking_core pluginlib rclcpp rclcpp_action rclcpp_lifecycle sensor_msgs tf2_ros yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A Task Server for robot charger docking";
  };
}
