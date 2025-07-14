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
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."crazyflie_py";
  propagatedNativeBuildInputs = [ crazyflie-interfaces rclpy ];
  propagatedBuildInputs = [ crazyflie-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "crazyflie_py" = substituteSource {
      src = fetchgit {
        name = "crazyflie_py-source";
        url = "https://github.com/ros2-gbp/crazyswarm2-release.git";
        rev = "a0b4227ab0abbb7fa2af57013e2fffa546dd3fe0";
        hash = "sha256-UMkn0OM5+vy0sHHTMh7OGpDJ2t6CnUJWNvVLiuuKvpE=";
      };
    };
  });
  meta = {
    description = "Simple Python Interface for Crayzswarm2";
  };
})
