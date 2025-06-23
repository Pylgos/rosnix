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
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "turtlebot3_automatic_parking";
  version = "1.3.2-1";
  src = finalAttrs.passthru.sources."turtlebot3_automatic_parking";
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs rclpy sensor-msgs std-msgs ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclpy sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_automatic_parking" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_automatic_parking-source";
        url = "https://github.com/ros2-gbp/turtlebot3_applications-release.git";
        rev = "7ea68e533140301e3095988b970004bbcb556c3b";
        hash = "sha256-WRBWB5S2DEnIhJWWJmTAHFMt0X9xb8Je0W6Kg/Wbay0=";
      };
    };
  });
  meta = {
    description = "\n	  Package for turtlebot3 automatic_parking.\n  ";
  };
})
