{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "teleop_twist_keyboard";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."teleop_twist_keyboard";
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ geometry-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ];
  passthru.sources = mkSourceSet (sources: {
    "teleop_twist_keyboard" = substituteSource {
      src = fetchgit {
        name = "teleop_twist_keyboard-source";
        url = "https://github.com/ros2-gbp/teleop_twist_keyboard-release.git";
        rev = "ef5f09a61f8f264b04814a0e2d2f596da85eb27d";
        hash = "sha256-RIp2xSUZdrlSj/8rUnbFawM86Cz5qYfDOhW28D0mr3Q=";
      };
    };
  });
  meta = {
    description = "A robot-agnostic teleoperation node to convert keyboard commands to Twist messages.";
  };
})
