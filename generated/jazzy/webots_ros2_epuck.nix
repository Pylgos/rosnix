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
  nav_msgs,
  python3Packages,
  rclpy,
  robot_state_publisher,
  rviz2,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2_ros,
  webots_ros2_control,
  webots_ros2_driver,
  webots_ros2_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    webots_ros2_epuck = substituteSource {
      src = fetchgit {
        name = "webots_ros2_epuck-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "e84db3fd2f0ea3abaa5a71d3276ab5e2196e24c4";
        hash = "sha256-Em4RVC4wQa1yoFZKEoSapNa94dL24g4MqYxIRXKc9Ok=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2_epuck";
  version = "2023.1.3-1";
  src = sources.webots_ros2_epuck;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces controller_manager diff_drive_controller geometry_msgs joint_state_broadcaster nav_msgs rclpy robot_state_publisher rviz2 sensor_msgs std_msgs tf2_ros webots_ros2_control webots_ros2_driver webots_ros2_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "E-puck2 driver for Webots simulated robot";
  };
}
