{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  robot-state-publisher,
  ros2-control,
  ros2-controllers,
  rosSystemPackages,
  rviz2,
  substituteSource,
  turtlebot3-manipulation-description,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_manipulation_bringup";
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."turtlebot3_manipulation_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ robot-state-publisher ros2-control ros2-controllers rviz2 turtlebot3-manipulation-description xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher ros2-control ros2-controllers rviz2 turtlebot3-manipulation-description xacro ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_manipulation_bringup" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_manipulation_bringup-source";
        url = "https://github.com/ros2-gbp/turtlebot3_manipulation-release.git";
        rev = "be6895e6137d1599800d271ebe841c7c8864a055";
        hash = "sha256-xBu0vOMqhgGqA9DEb+4Mc9OOBvd6QeWJFK3DbO+Md6Q=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 package for turtlebot3_manipulation\n  ";
  };
})
