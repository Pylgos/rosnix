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
  rclpy,
  robot_state_publisher,
  rosSystemPackages,
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
    webots_ros2_epuck-47f9066772aa1aaaba31885c6d5c2d9f4186e8f6 = substituteSource {
      src = fetchgit {
        name = "webots_ros2_epuck-47f9066772aa1aaaba31885c6d5c2d9f4186e8f6-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "47f9066772aa1aaaba31885c6d5c2d9f4186e8f6";
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
  src = sources.webots_ros2_epuck-47f9066772aa1aaaba31885c6d5c2d9f4186e8f6;
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces controller_manager diff_drive_controller geometry_msgs joint_state_broadcaster nav_msgs rclpy robot_state_publisher rviz2 sensor_msgs std_msgs tf2_ros webots_ros2_control webots_ros2_driver webots_ros2_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "E-puck2 driver for Webots simulated robot";
  };
}
