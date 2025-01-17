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
  version = "2.2.5-5";
  src = finalAttrs.passthru.sources."turtlebot3_gazebo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclcpp sensor-msgs tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gazebo_ros_pkgs" ]; };
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_gazebo" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_gazebo-source";
        url = "https://github.com/ros2-gbp/turtlebot3_simulations-release.git";
        rev = "2052448a92e43ce2ed8565594d944ba638f78bd9";
        hash = "sha256-v6xnRm6M8asU/HVNlinmuyhrm7cTaIuA3aSHJzPeX6c=";
      };
    };
  });
  meta = {
    description = "Gazebo simulation package for the TurtleBot3";
  };
})
