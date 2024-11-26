{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_gazebo";
  version = "2.2.5-4";
  src = finalAttrs.passthru.sources."turtlebot3_gazebo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclcpp sensor-msgs tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gazebo_ros_pkgs" ]; };
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_gazebo" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_gazebo-source";
        url = "https://github.com/ros2-gbp/turtlebot3_simulations-release.git";
        rev = "434656b1bec803b2902412c911eec878dd666ac6";
        hash = "sha256-v6xnRm6M8asU/HVNlinmuyhrm7cTaIuA3aSHJzPeX6c=";
      };
    };
  });
  meta = {
    description = "Gazebo simulation package for the TurtleBot3";
  };
})
