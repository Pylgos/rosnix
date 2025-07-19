{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-ros,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "turtlebot3_home_service_challenge_aruco";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."turtlebot3_home_service_challenge_aruco";
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs rclpy sensor-msgs std-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" "python3-opencv" "python3-scipy" ]; };
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclpy sensor-msgs std-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-opencv" "python3-scipy" ]; };
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_home_service_challenge_aruco" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_home_service_challenge_aruco-source";
        url = "https://github.com/ros2-gbp/turtlebot3_home_service_challenge-release.git";
        rev = "d75ced98511b038589eecce827cad9fdb189bd4a";
        hash = "sha256-KcQP7HQbesLcpdGAOQD0DsJzOmLrO6Nz12ZxkoYm78Y=";
      };
    };
  });
  meta = {
    description = "\n    Using aruco package for turtlebot3_home_service_challenge\n  ";
  };
})
