{
  ament_copyright,
  buildRosPackage,
  builtin_interfaces,
  controller_manager,
  diff_drive_controller,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
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
    webots_ros2_tiago = substituteSource {
      src = fetchgit {
        name = "webots_ros2_tiago-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "52431f1869c9f2d891411a5659830af752083a55";
        hash = "sha256-DZQWy3i/GDQNwnUZ0pD/Bm+cEkSqvUwuYeE+PehZtyk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2_tiago";
  version = "2023.1.3-1";
  src = sources.webots_ros2_tiago;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces controller_manager diff_drive_controller geometry_msgs joint_state_broadcaster rclpy robot_state_publisher rviz2 tf2_ros webots_ros2_control webots_ros2_driver ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "TIAGo robots ROS2 interface for Webots.";
  };
}
