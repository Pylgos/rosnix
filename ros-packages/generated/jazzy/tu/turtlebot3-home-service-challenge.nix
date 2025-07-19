{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  turtlebot3-home-service-challenge-aruco,
  turtlebot3-home-service-challenge-core,
  turtlebot3-home-service-challenge-manipulator,
  turtlebot3-home-service-challenge-tools,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_home_service_challenge";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."turtlebot3_home_service_challenge";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ turtlebot3-home-service-challenge-aruco turtlebot3-home-service-challenge-core turtlebot3-home-service-challenge-manipulator turtlebot3-home-service-challenge-tools ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ turtlebot3-home-service-challenge-aruco turtlebot3-home-service-challenge-core turtlebot3-home-service-challenge-manipulator turtlebot3-home-service-challenge-tools ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_home_service_challenge" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_home_service_challenge-source";
        url = "https://github.com/ros2-gbp/turtlebot3_home_service_challenge-release.git";
        rev = "ae3b785012a45fbcf77a5efba375c12f2cb7f8a0";
        hash = "sha256-SruOU5ILDnranRkxe3C0GwRWwT2qNg5WUQ69i4qh5aY=";
      };
    };
  });
  meta = {
    description = "\n    ROS packages for the Turtlebot3 Home Service Challenge (meta package)\n  ";
  };
})
