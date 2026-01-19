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
  version = "4.1.2-1";
  src = finalAttrs.passthru.sources."open_manipulator_teleop";
  propagatedNativeBuildInputs = [ control-msgs rclpy sensor-msgs std-msgs trajectory-msgs ];
  propagatedBuildInputs = [ control-msgs rclpy sensor-msgs std-msgs trajectory-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_teleop" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_teleop-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "51a54bd1316d1f3b6cb62d2a8d10a0077b423107";
        hash = "sha256-SvfvZaE/wsMo95xIWxbK2iH8lIedPhW5LdtNDYEP5wA=";
      };
    };
  });
  meta = {
    description = "OpenManipulator teleoperation package";
  };
})
