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
        rev = "722716cae2fd7324ff96718aba41485c41618c9f";
        hash = "sha256-5hRw+DpQJKcb3WWPWjKb1/8OpZg3zJ85hW3HuMZRwO0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "robot_localization";
  version = "3.9.0-1";
  src = sources.robot_localization;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ builtin_interfaces ];
  propagatedBuildInputs = [ angles diagnostic_msgs diagnostic_updater eigen geographic_msgs geographiclib geometry_msgs message_filters nav_msgs python3Packages.boost rclcpp rmw_implementation rosidl_default_runtime sensor_msgs std_msgs std_srvs tf2 tf2_eigen tf2_geometry_msgs tf2_ros yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common builtin_interfaces launch_ros launch_testing_ament_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "Provides nonlinear state estimation through sensor fusion of an abritrary number of sensors.";
  };
}
