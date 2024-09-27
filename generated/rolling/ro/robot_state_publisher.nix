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
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2_ros,
  urdf,
}:
let
  sources = rec {
    robot_state_publisher-ec77148a420bc7ebc6727077436a2feb6b7aadc0 = substituteSource {
      src = fetchgit {
        name = "robot_state_publisher-ec77148a420bc7ebc6727077436a2feb6b7aadc0-source";
        url = "https://github.com/ros2-gbp/robot_state_publisher-release.git";
        rev = "ec77148a420bc7ebc6727077436a2feb6b7aadc0";
        hash = "sha256-LZBeqk7Kua+ROcmdZZfIUe+gIWb4W7TAiPXrViz6Aj4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "robot_state_publisher";
  version = "3.4.1-1";
  src = sources.robot_state_publisher-ec77148a420bc7ebc6727077436a2feb6b7aadc0;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs kdl_parser orocos_kdl_vendor rcl_interfaces rclcpp rclcpp_components sensor_msgs std_msgs tf2_ros urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common launch_ros launch_testing_ament_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package take the joint angles of a robot as input, and publishes the 3D poses of the robot links to tf2, using a kinematic tree model of the robot.";
  };
}
