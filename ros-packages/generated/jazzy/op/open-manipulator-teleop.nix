{
  buildAmentPythonPackage,
  control-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  trajectory-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "open_manipulator_teleop";
  version = "4.1.0-1";
  src = finalAttrs.passthru.sources."open_manipulator_teleop";
  propagatedNativeBuildInputs = [ control-msgs rclpy sensor-msgs std-msgs trajectory-msgs ];
  propagatedBuildInputs = [ control-msgs rclpy sensor-msgs std-msgs trajectory-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_teleop" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_teleop-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "46208cafb12fcfd29c40c23d375bca80331359bf";
        hash = "sha256-Ni4lS9LoAv3qYMaQyr+Hswwle1Fty9Ch0uqOw2DpGho=";
      };
    };
  });
  meta = {
    description = "OpenManipulator teleoperation package";
  };
})
