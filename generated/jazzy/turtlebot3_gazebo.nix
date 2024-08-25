{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rclcpp,
  sensor_msgs,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    turtlebot3_gazebo = substituteSource {
      src = fetchgit {
        name = "turtlebot3_gazebo-source";
        url = "https://github.com/ros2-gbp/turtlebot3_simulations-release.git";
        rev = "2052448a92e43ce2ed8565594d944ba638f78bd9";
        hash = "sha256-v6xnRm6M8asU/HVNlinmuyhrm7cTaIuA3aSHJzPeX6c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_gazebo";
  version = "2.2.5-5";
  src = sources.turtlebot3_gazebo;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav_msgs rclcpp sensor_msgs tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "gazebo_ros_pkgs" ];
  meta = {
    description = "Gazebo simulation package for the TurtleBot3";
  };
}
