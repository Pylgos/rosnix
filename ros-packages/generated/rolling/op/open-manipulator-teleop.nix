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
  version = "4.0.5-1";
  src = finalAttrs.passthru.sources."open_manipulator_teleop";
  propagatedNativeBuildInputs = [ control-msgs rclpy sensor-msgs std-msgs trajectory-msgs ];
  propagatedBuildInputs = [ control-msgs rclpy sensor-msgs std-msgs trajectory-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_teleop" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_teleop-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "b8e8242bd9dd81cf93ee1d83605bda019069f52c";
        hash = "sha256-SIBcaY7HV/tJAmvmvWYk5bPf5dzIxupecwRu1pSJSng=";
      };
    };
  });
  meta = {
    description = "OpenManipulator teleoperation package";
  };
})
