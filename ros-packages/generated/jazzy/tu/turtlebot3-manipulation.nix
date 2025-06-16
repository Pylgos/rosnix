{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  turtlebot3-manipulation-bringup,
  turtlebot3-manipulation-cartographer,
  turtlebot3-manipulation-description,
  turtlebot3-manipulation-hardware,
  turtlebot3-manipulation-moveit-config,
  turtlebot3-manipulation-navigation2,
  turtlebot3-manipulation-teleop,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_manipulation";
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."turtlebot3_manipulation";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ turtlebot3-manipulation-bringup turtlebot3-manipulation-cartographer turtlebot3-manipulation-description turtlebot3-manipulation-hardware turtlebot3-manipulation-moveit-config turtlebot3-manipulation-navigation2 turtlebot3-manipulation-teleop ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ turtlebot3-manipulation-bringup turtlebot3-manipulation-cartographer turtlebot3-manipulation-description turtlebot3-manipulation-hardware turtlebot3-manipulation-moveit-config turtlebot3-manipulation-navigation2 turtlebot3-manipulation-teleop ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_manipulation" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_manipulation-source";
        url = "https://github.com/ros2-gbp/turtlebot3_manipulation-release.git";
        rev = "cf58abe21b1e92723c9f2a32400c823253a747c4";
        hash = "sha256-XF/CQdBGqTMS2wMDdHjUtwtKhujjLwS7f6mZjnrrhss=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 package for turtlebot3_manipulation\n  ";
  };
})
