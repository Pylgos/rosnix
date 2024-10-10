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
let
  sources = mkSourceSet (sources: {
    "bno055" = substituteSource {
      src = fetchgit {
        name = "bno055-source";
        url = "https://github.com/ros2-gbp/bno055-release.git";
        rev = "49988d444537b50ab1266226e494e3b7253d64d7";
        hash = "sha256-C8wFVPMD9UXtgtXX3T4ERtwtrr1IKIwYwiGzp1XWbS4=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentPythonPackage (finalAttrs: {
  pname = "bno055";
  version = "0.5.0-3";
  src = finalAttrs.passthru.sources."bno055";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ example-interfaces rclpy std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-serial" "python3-smbus" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Bosch BNO055 IMU driver for ROS2";
  };
})
