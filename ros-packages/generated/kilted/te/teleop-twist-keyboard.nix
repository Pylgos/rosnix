{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rcl-interfaces,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "teleop_twist_keyboard";
  version = "2.4.1-1";
  src = finalAttrs.passthru.sources."teleop_twist_keyboard";
  propagatedNativeBuildInputs = [ geometry-msgs rcl-interfaces rclpy ];
  propagatedBuildInputs = [ geometry-msgs rcl-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "teleop_twist_keyboard" = substituteSource {
      src = fetchgit {
        name = "teleop_twist_keyboard-source";
        url = "https://github.com/ros2-gbp/teleop_twist_keyboard-release.git";
        rev = "edbb84130e45e5006bba68960fe21804a93007f9";
        hash = "sha256-oQY9bKalutf6beuXGykX/GL/qduZQvN7oIUqxjmbP4s=";
      };
    };
  });
  meta = {
    description = "\n    A robot-agnostic teleoperation node to convert keyboard commands to Twist\n    messages.\n  ";
  };
})
