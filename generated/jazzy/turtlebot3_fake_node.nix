{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rclcpp,
  robot_state_publisher,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_msgs,
  turtlebot3_msgs,
}:
let
  sources = rec {
    turtlebot3_fake_node = substituteSource {
      src = fetchgit {
        name = "turtlebot3_fake_node-source";
        url = "https://github.com/ros2-gbp/turtlebot3_simulations-release.git";
        rev = "d51d854fb17df3f0dc2ab07fb0a086f8166bca5e";
        hash = "sha256-RC56Xh4EBNwDvXTRDOIw1kV2Q9fZB4veFuXoOZI3KZA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_fake_node";
  version = "2.2.5-5";
  src = sources.turtlebot3_fake_node;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav_msgs rclcpp robot_state_publisher sensor_msgs tf2 tf2_msgs turtlebot3_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Package for TurtleBot3 fake node. With this package, simple tests can be done without a robot. You can do simple tests using this package on rviz without real robots.";
  };
}
