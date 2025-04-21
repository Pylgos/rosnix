{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav2-bringup,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_navigation2";
  version = "2.2.9-1";
  src = finalAttrs.passthru.sources."turtlebot3_navigation2";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ nav2-bringup ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_navigation2" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_navigation2-source";
        url = "https://github.com/ros2-gbp/turtlebot3-release.git";
        rev = "c8cfce6b9e72fc3380a7e28464a52440a2471ea7";
        hash = "sha256-hdQIcgHUjZvdWdk1DHpUgWwMTHqrBoApYHcyPTBfKmw=";
      };
    };
  });
  meta = {
    description = "ROS 2 launch scripts for navigation2";
  };
})
