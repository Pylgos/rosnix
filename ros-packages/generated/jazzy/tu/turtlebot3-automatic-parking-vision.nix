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
  std-msgs,
  substituteSource,
  tf2-ros,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "turtlebot3_automatic_parking_vision";
  version = "1.3.2-1";
  src = finalAttrs.passthru.sources."turtlebot3_automatic_parking_vision";
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs rclpy std-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-scipy" ]; };
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclpy std-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-scipy" ]; };
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_automatic_parking_vision" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_automatic_parking_vision-source";
        url = "https://github.com/ros2-gbp/turtlebot3_applications-release.git";
        rev = "be6481108b03f568d1be85c2aa6e1a277050c3e5";
        hash = "sha256-Om5p/Rfc2TrD+hJyY77sT9Hgg+aNC4ogFh4cVLVpQLc=";
      };
    };
  });
  meta = {
    description = "\n	  Automatic Parking Vision for TurtleBot3 Examples.\n  ";
  };
})
