{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_action,
  rcutils,
  rosSystemPackages,
  ros_gz_interfaces,
  sensor_msgs,
  std_msgs,
  substituteSource,
  turtlebot4_msgs,
}:
let
  sources = rec {
    turtlebot4_gz_toolbox = substituteSource {
      src = fetchFromGitHub {
        name = "turtlebot4_gz_toolbox-source";
        owner = "ros2-gbp";
        repo = "turtlebot4_simulator-release";
        rev = "a97d4d39680e82acbb6344c658dfeb32a89776c2";
        hash = "sha256-sWTB4RzEb2FN23KkQTWoD37XRF0iJAiN0G/tdaME5to=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_gz_toolbox";
  version = "2.0.0-1";
  src = sources.turtlebot4_gz_toolbox;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp_action rcutils ros_gz_interfaces sensor_msgs std_msgs turtlebot4_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Turtlebot4 Gazebo Toolbox";
  };
}
