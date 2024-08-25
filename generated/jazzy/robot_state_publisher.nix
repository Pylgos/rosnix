{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  kdl_parser,
  launch_ros,
  launch_testing_ament_cmake,
  orocos_kdl_vendor,
  rcl_interfaces,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2_ros,
  urdf,
}:
let
  sources = rec {
    robot_state_publisher = substituteSource {
      src = fetchgit {
        name = "robot_state_publisher-source";
        url = "https://github.com/ros2-gbp/robot_state_publisher-release.git";
        rev = "877b7bc7de42bf1fdb65631902b524a0f70c5942";
        hash = "sha256-5FTqMqeamQAFt8XEpHuYh6JzILoqjaGujXl4Q30xwro=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "robot_state_publisher";
  version = "3.3.3-3";
  src = sources.robot_state_publisher;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs kdl_parser orocos_kdl_vendor rcl_interfaces rclcpp rclcpp_components sensor_msgs std_msgs tf2_ros urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common launch_ros launch_testing_ament_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "This package take the joint angles of a robot as input, and publishes the 3D poses of the robot links to tf2, using a kinematic tree model of the robot.";
  };
}
