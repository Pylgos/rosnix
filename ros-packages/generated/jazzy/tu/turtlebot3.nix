{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  turtlebot3-bringup,
  turtlebot3-cartographer,
  turtlebot3-description,
  turtlebot3-example,
  turtlebot3-navigation2,
  turtlebot3-node,
  turtlebot3-teleop,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3";
  version = "2.3.4-1";
  src = finalAttrs.passthru.sources."turtlebot3";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ turtlebot3-bringup turtlebot3-cartographer turtlebot3-description turtlebot3-example turtlebot3-navigation2 turtlebot3-node turtlebot3-teleop ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ turtlebot3-bringup turtlebot3-cartographer turtlebot3-description turtlebot3-example turtlebot3-navigation2 turtlebot3-node turtlebot3-teleop ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3" = substituteSource {
      src = fetchgit {
        name = "turtlebot3-source";
        url = "https://github.com/ros2-gbp/turtlebot3-release.git";
        rev = "b3d97d26dd8eb829b9513902805459849cccbaf0";
        hash = "sha256-kKkfPYdGz04dirGU+NCwimc8okYzDIlZDpUhHN9MWx4=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 packages for TurtleBot3\n  ";
  };
})
