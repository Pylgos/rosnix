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
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_msgs,
  turtlebot3_msgs,
}:
let
  sources = rec {
    turtlebot3_fake_node-c2a2121b2179d504baa55dc1cba6b33fb0adcfce = substituteSource {
      src = fetchgit {
        name = "turtlebot3_fake_node-c2a2121b2179d504baa55dc1cba6b33fb0adcfce-source";
        url = "https://github.com/ros2-gbp/turtlebot3_simulations-release.git";
        rev = "c2a2121b2179d504baa55dc1cba6b33fb0adcfce";
        hash = "sha256-RC56Xh4EBNwDvXTRDOIw1kV2Q9fZB4veFuXoOZI3KZA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_fake_node";
  version = "2.2.5-4";
  src = sources.turtlebot3_fake_node-c2a2121b2179d504baa55dc1cba6b33fb0adcfce;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs nav_msgs rclcpp robot_state_publisher sensor_msgs tf2 tf2_msgs turtlebot3_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package for TurtleBot3 fake node. With this package, simple tests can be done without a robot. You can do simple tests using this package on rviz without real robots.";
  };
}
