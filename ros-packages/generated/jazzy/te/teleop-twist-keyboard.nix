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
  version = "2.4.0-2";
  src = finalAttrs.passthru.sources."teleop_twist_keyboard";
  propagatedNativeBuildInputs = [ geometry-msgs rclpy ];
  propagatedBuildInputs = [ geometry-msgs rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ];
  passthru.sources = mkSourceSet (sources: {
    "teleop_twist_keyboard" = substituteSource {
      src = fetchgit {
        name = "teleop_twist_keyboard-source";
        url = "https://github.com/ros2-gbp/teleop_twist_keyboard-release.git";
        rev = "4a7be17b9cce71cb672485fb1e0afecf3bba628f";
        hash = "sha256-RIp2xSUZdrlSj/8rUnbFawM86Cz5qYfDOhW28D0mr3Q=";
      };
    };
  });
  meta = {
    description = "\n    A robot-agnostic teleoperation node to convert keyboard commands to Twist\n    messages.\n  ";
  };
})
