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
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."open_manipulator_teleop";
  propagatedNativeBuildInputs = [ control-msgs rclpy sensor-msgs std-msgs trajectory-msgs ];
  propagatedBuildInputs = [ control-msgs rclpy sensor-msgs std-msgs trajectory-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_teleop" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_teleop-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "b25671e4af1bc0f944e056fd6421495a62784a14";
        hash = "sha256-oFE9r+oZXl7RV5O6vXPGJNbp/4CCb0QPOfc2RE4flMM=";
      };
    };
  });
  meta = {
    description = "OpenManipulator teleoperation package";
  };
})
