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
  version = "3.2.2-1";
  src = finalAttrs.passthru.sources."open_manipulator_teleop";
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ control-msgs sensor-msgs std-msgs trajectory-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_teleop" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_teleop-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "816485b8bfbfa3892d9e7c869a71a8f3e209a34b";
        hash = "sha256-csabnS5fyGq/m06e5xnCV0tjC1SjlV0BRILQgs67zLw=";
      };
    };
  });
  meta = {
    description = "OpenManipulator teleoperation package";
  };
})
