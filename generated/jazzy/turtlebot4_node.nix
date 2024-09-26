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
  rosSystemPackages,
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
        rev = "0be5e29b81e3aa797dfc9f7631336960ed2a66ab";
        hash = "sha256-GrJ7FKrgpc0hJWDIvcvyIKAR9f1LaCkTIpqzA2IncgM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_node";
  version = "2.0.1-1";
  src = sources.turtlebot4_node;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ irobot_create_msgs rclcpp rclcpp_action rcutils sensor_msgs std_msgs std_srvs turtlebot4_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Turtlebot4 Node";
  };
}
