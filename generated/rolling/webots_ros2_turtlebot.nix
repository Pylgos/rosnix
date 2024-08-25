{
  ament_copyright,
  buildRosPackage,
  builtin_interfaces,
  controller_manager,
  diff_drive_controller,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_broadcaster,
  python3Packages,
  rclpy,
  robot_state_publisher,
  rviz2,
  substituteSource,
  tf2_ros,
  webots_ros2_control,
  webots_ros2_driver,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    webots_ros2_turtlebot = substituteSource {
      src = fetchgit {
        name = "webots_ros2_turtlebot-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "4e9488d44cac30db5bb962bab23d369bb4fe2886";
        hash = "sha256-evpv72wFd54k1J7+73ZIwzfKiS5H2Yta/AVnzHPLwK8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2_turtlebot";
  version = "2023.1.3-1";
  src = sources.webots_ros2_turtlebot;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces controller_manager diff_drive_controller joint_state_broadcaster rclpy robot_state_publisher rviz2 tf2_ros webots_ros2_control webots_ros2_driver ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "TurtleBot3 Burger robot ROS2 interface for Webots.";
  };
}
