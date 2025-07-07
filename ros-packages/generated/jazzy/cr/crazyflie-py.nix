{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  crazyflie-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "crazyflie_py";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."crazyflie_py";
  propagatedNativeBuildInputs = [ crazyflie-interfaces rclpy ];
  propagatedBuildInputs = [ crazyflie-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "crazyflie_py" = substituteSource {
      src = fetchgit {
        name = "crazyflie_py-source";
        url = "https://github.com/ros2-gbp/crazyswarm2-release.git";
        rev = "a02a6deecfdcff2ac46add3b44886583f19149e4";
        hash = "sha256-Ol1fnWzuXPMSvgJ1kOyBB5kYWw9Hg7WwHCaKzDkJS7U=";
      };
    };
  });
  meta = {
    description = "Simple Python Interface for Crayzswarm2";
  };
})
