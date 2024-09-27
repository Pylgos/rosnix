{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mkSourceSet,
  nav_msgs,
  rclcpp,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
  tf2,
}:
let
  sources = mkSourceSet (sources: {
    "turtlebot3_gazebo" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_gazebo-source";
        url = "https://github.com/ros2-gbp/turtlebot3_simulations-release.git";
        rev = "434656b1bec803b2902412c911eec878dd666ac6";
        hash = "sha256-v6xnRm6M8asU/HVNlinmuyhrm7cTaIuA3aSHJzPeX6c=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "turtlebot3_gazebo";
  version = "2.2.5-4";
  src = sources."turtlebot3_gazebo";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs nav_msgs rclcpp sensor_msgs tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gazebo_ros_pkgs" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Gazebo simulation package for the TurtleBot3";
  };
}
