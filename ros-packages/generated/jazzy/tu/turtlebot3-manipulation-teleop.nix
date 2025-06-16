{
  ament-cmake,
  buildAmentCmakePackage,
  control-msgs,
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
  turtlebot3-manipulation-bringup,
  turtlebot3-manipulation-description,
  turtlebot3-manipulation-moveit-config,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_manipulation_teleop";
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."turtlebot3_manipulation_teleop";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ control-msgs geometry-msgs nav-msgs rclcpp sensor-msgs turtlebot3-manipulation-bringup turtlebot3-manipulation-description turtlebot3-manipulation-moveit-config ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ control-msgs geometry-msgs nav-msgs rclcpp sensor-msgs turtlebot3-manipulation-bringup turtlebot3-manipulation-description turtlebot3-manipulation-moveit-config ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_manipulation_teleop" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_manipulation_teleop-source";
        url = "https://github.com/ros2-gbp/turtlebot3_manipulation-release.git";
        rev = "f73a2d16abb1315d3915275ef3eff08ef13d90cb";
        hash = "sha256-Hg9EB3Q2zcZlhgCaVorLq9Q1mLWumFVSAbxIEqtzDME=";
      };
    };
  });
  meta = {
    description = "Ros2 Package of the turtlebot3_manipulation_teleop";
  };
})
