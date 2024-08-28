{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  builtin_interfaces,
  diagnostic_msgs,
  diagnostic_updater,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  geographiclib,
  geometry_msgs,
  launch_ros,
  launch_testing_ament_cmake,
  message_filters,
  nav_msgs,
  python3Packages,
  rclcpp,
  rmw_implementation,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_ros,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    robot_localization = substituteSource {
      src = fetchgit {
        name = "robot_localization-source";
        url = "https://github.com/ros2-gbp/robot_localization-release.git";
        rev = "fe41f9d50fca415b7945a70a70cd77fba858db9e";
        hash = "sha256-GpzFamql3QOEMFc2VxVaRveYni8bElyv48UgJHAwel8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "robot_localization";
  version = "3.8.0-1";
  src = sources.robot_localization;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [ eigen ];
  buildInputs = [ builtin_interfaces ];
  propagatedBuildInputs = [ angles diagnostic_msgs diagnostic_updater geographic_msgs geographiclib geometry_msgs message_filters nav_msgs python3Packages.boost rclcpp rmw_implementation rosidl_default_runtime sensor_msgs std_msgs std_srvs tf2 tf2_eigen tf2_geometry_msgs tf2_ros yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common builtin_interfaces launch_ros launch_testing_ament_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "Provides nonlinear state estimation through sensor fusion of an abritrary number of sensors.";
  };
}
