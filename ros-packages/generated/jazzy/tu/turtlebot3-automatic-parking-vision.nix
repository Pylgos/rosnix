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
  version = "1.3.3-1";
  src = finalAttrs.passthru.sources."turtlebot3_automatic_parking_vision";
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs rclpy std-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-scipy" ]; };
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclpy std-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-scipy" ]; };
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_automatic_parking_vision" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_automatic_parking_vision-source";
        url = "https://github.com/ros2-gbp/turtlebot3_applications-release.git";
        rev = "20219915a8938f2486451010eedeede2b989f70b";
        hash = "sha256-dymH4Oh0KJfiwYJ2XrMJGaHS2vSRHL/IhmmENHPDHJ8=";
      };
    };
  });
  meta = {
    description = "\n	  Automatic Parking Vision for TurtleBot3 Examples.\n  ";
  };
})
