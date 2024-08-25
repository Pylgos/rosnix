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
  python3Packages,
  rclpy,
  robot_state_publisher,
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
    webots_ros2_universal_robot = substituteSource {
      src = fetchgit {
        name = "webots_ros2_universal_robot-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "ad46e500bc2abf710047d5b8c4c2842b8680643a";
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
  src = sources.webots_ros2_universal_robot;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces control_msgs controller_manager joint_state_broadcaster joint_trajectory_controller rclpy robot_state_publisher rviz2 trajectory_msgs webots_ros2_control webots_ros2_driver xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Universal Robot ROS2 interface for Webots.";
  };
}
