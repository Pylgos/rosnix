{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "joy_tester";
  version = "0.0.2-3";
  src = finalAttrs.passthru.sources."joy_tester";
  propagatedNativeBuildInputs = [ rclpy sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-tk" ]; };
  propagatedBuildInputs = [ rclpy sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-tk" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "joy_tester" = substituteSource {
      src = fetchgit {
        name = "joy_tester-source";
        url = "https://github.com/ros2-gbp/joy_tester-release.git";
        rev = "6cdf1a3e3fd9e9c590ce3e563f7ba1f7e14e103c";
        hash = "sha256-4aFhMjPuS3BCh6fHb0WNYkfy1WWLeNrxlXiK8vs/zGI=";
      };
    };
  });
  meta = {
    description = "Simple GUI tool for testing joysticks/gamepads";
  };
})
