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
  version = "2.3.4-1";
  src = finalAttrs.passthru.sources."turtlebot3_navigation2";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ nav2-bringup ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nav2-bringup ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_navigation2" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_navigation2-source";
        url = "https://github.com/ros2-gbp/turtlebot3-release.git";
        rev = "eab1fc25c620e8dbb61e3541174c95eef7c165da";
        hash = "sha256-bl7ZTUoKNeRdI1S5ZRa65CVBtbI5RPpr6VhZPsmnBXI=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 launch scripts for navigation2\n  ";
  };
})
