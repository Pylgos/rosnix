{
  ament_copyright,
  buildRosPackage,
  builtin_interfaces,
  control_msgs,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_broadcaster,
  joint_trajectory_controller,
  rclpy,
  robot_state_publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  trajectory_msgs,
  webots_ros2_control,
  webots_ros2_driver,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    webots_ros2_universal_robot-9306333154cc8e532e6b777b38260c95868bc03c = substituteSource {
      src = fetchgit {
        name = "webots_ros2_universal_robot-9306333154cc8e532e6b777b38260c95868bc03c-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "9306333154cc8e532e6b777b38260c95868bc03c";
        hash = "sha256-sr/NzavBNSysD8uGaVJAkkImtUr7YgJ0R89t3yILp20=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2_universal_robot";
  version = "2023.1.3-1";
  src = sources.webots_ros2_universal_robot-9306333154cc8e532e6b777b38260c95868bc03c;
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces control_msgs controller_manager joint_state_broadcaster joint_trajectory_controller rclpy robot_state_publisher rviz2 trajectory_msgs webots_ros2_control webots_ros2_driver xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Universal Robot ROS2 interface for Webots.";
  };
}
