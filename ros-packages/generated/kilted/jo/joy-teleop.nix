{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  control-msgs,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch-ros,
  launch-testing,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  rosidl-runtime-py,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  teleop-tools-msgs,
  test-msgs,
  trajectory-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "joy_teleop";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."joy_teleop";
  propagatedNativeBuildInputs = [ control-msgs rclpy rosidl-runtime-py sensor-msgs teleop-tools-msgs trajectory-msgs ];
  propagatedBuildInputs = [ control-msgs rclpy rosidl-runtime-py sensor-msgs teleop-tools-msgs trajectory-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint example-interfaces geometry-msgs launch-ros launch-testing std-msgs std-srvs test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "joy_teleop" = substituteSource {
      src = fetchgit {
        name = "joy_teleop-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "3e2b27b0eb452fe81b20a02d338b4eb346640ec7";
        hash = "sha256-00KOv5oiaDBFWgJXzXUr7GF7AT8jy2M9XNpUJvmVW6w=";
      };
    };
  });
  meta = {
    description = "A (to be) generic joystick interface to control a robot";
  };
})
