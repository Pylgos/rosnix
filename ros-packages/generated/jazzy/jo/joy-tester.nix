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
  version = "0.0.2-4";
  src = finalAttrs.passthru.sources."joy_tester";
  propagatedBuildInputs = [ rclpy sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-tk" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "joy_tester" = substituteSource {
      src = fetchgit {
        name = "joy_tester-source";
        url = "https://github.com/ros2-gbp/joy_tester-release.git";
        rev = "7287ff765bbd548f037e3d25bea88aeaca17a6f2";
        hash = "sha256-4aFhMjPuS3BCh6fHb0WNYkfy1WWLeNrxlXiK8vs/zGI=";
      };
    };
  });
  meta = {
    description = "Simple GUI tool for testing joysticks/gamepads";
  };
})
