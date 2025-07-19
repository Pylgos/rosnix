{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "bno055";
  version = "0.5.0-3";
  src = finalAttrs.passthru.sources."bno055";
  propagatedNativeBuildInputs = [ example-interfaces rclpy std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-serial" "python3-smbus" ]; };
  propagatedBuildInputs = [ example-interfaces rclpy std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-serial" "python3-smbus" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "bno055" = substituteSource {
      src = fetchgit {
        name = "bno055-source";
        url = "https://github.com/ros2-gbp/bno055-release.git";
        rev = "6b4f759ea81a986916a9d4cb34c1c64adbee6787";
        hash = "sha256-C8wFVPMD9UXtgtXX3T4ERtwtrr1IKIwYwiGzp1XWbS4=";
      };
    };
  });
  meta = {
    description = "Bosch BNO055 IMU driver for ROS2";
  };
})
