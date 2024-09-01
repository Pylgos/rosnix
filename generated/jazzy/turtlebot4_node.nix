{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot_create_msgs,
  rclcpp,
  rclcpp_action,
  rcutils,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  turtlebot4_msgs,
}:
let
  sources = rec {
    turtlebot4_node = substituteSource {
      src = fetchgit {
        name = "turtlebot4_node-source";
        url = "https://github.com/ros2-gbp/turtlebot4-release.git";
        rev = "7e0b46327cb09630fa39b409f89600d2cd6bdb77";
        hash = "sha256-AYV+336zTJubwG+79uERh5iZMyi7feAtMU9cxIJzPkI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_node";
  version = "2.0.0-1";
  src = sources.turtlebot4_node;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ irobot_create_msgs rclcpp rclcpp_action rcutils sensor_msgs std_msgs std_srvs turtlebot4_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Turtlebot4 Node";
  };
}
