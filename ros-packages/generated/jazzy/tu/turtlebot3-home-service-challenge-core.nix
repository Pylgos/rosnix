{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav2-msgs,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  turtlebot3-home-service-challenge-aruco,
  turtlebot3-home-service-challenge-manipulator,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "turtlebot3_home_service_challenge_core";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."turtlebot3_home_service_challenge_core";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ geometry-msgs nav2-msgs rclpy std-msgs turtlebot3-home-service-challenge-aruco turtlebot3-home-service-challenge-manipulator ];
  propagatedBuildInputs = [ geometry-msgs nav2-msgs rclpy std-msgs turtlebot3-home-service-challenge-aruco turtlebot3-home-service-challenge-manipulator ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_home_service_challenge_core" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_home_service_challenge_core-source";
        url = "https://github.com/ros2-gbp/turtlebot3_home_service_challenge-release.git";
        rev = "c04383b2e17dc2b7a658f129b36643bb757a7802";
        hash = "sha256-j6DaQHL6Sx/9Mx0Mfg6RcWOgyL3g4XDSk9D2l0deun0=";
      };
    };
  });
  meta = {
    description = "\n    Core package for turtlebot3_home_service_challenge\n  ";
  };
})
