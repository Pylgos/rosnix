{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  irobot_create_common_bringup,
  irobot_create_description,
  irobot_create_gz_bringup,
  irobot_create_gz_toolbox,
  irobot_create_msgs,
  irobot_create_nodes,
  irobot_create_toolbox,
  rosSystemPackages,
  ros_gz_interfaces,
  ros_gz_sim,
  std_msgs,
  substituteSource,
  turtlebot4_description,
  turtlebot4_gz_gui_plugins,
  turtlebot4_gz_toolbox,
  turtlebot4_msgs,
  turtlebot4_navigation,
  turtlebot4_node,
  turtlebot4_viz,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot4_gz_bringup = substituteSource {
      src = fetchgit {
        name = "turtlebot4_gz_bringup-source";
        url = "https://github.com/ros2-gbp/turtlebot4_simulator-release.git";
        rev = "ac19bf9bf475c12170ca7b01ab7c3939e298042e";
        hash = "sha256-k3vXzAg0WVo5WbwkUj/84aih5y9BibGw6gZ0CS8w7lc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_gz_bringup";
  version = "2.0.1-1";
  src = sources.turtlebot4_gz_bringup;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs irobot_create_common_bringup irobot_create_description irobot_create_gz_bringup irobot_create_gz_toolbox irobot_create_msgs irobot_create_nodes irobot_create_toolbox ros_gz_interfaces ros_gz_sim std_msgs turtlebot4_description turtlebot4_gz_gui_plugins turtlebot4_gz_toolbox turtlebot4_msgs turtlebot4_navigation turtlebot4_node turtlebot4_viz ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "TurtleBot 4 Gazebo Simulator bringup";
  };
}
