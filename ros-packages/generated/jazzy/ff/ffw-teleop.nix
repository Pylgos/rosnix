{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ffw_teleop";
  version = "1.0.9-1";
  src = finalAttrs.passthru.sources."ffw_teleop";
  propagatedNativeBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-tk" ]; };
  propagatedBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-tk" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ffw_teleop" = substituteSource {
      src = fetchgit {
        name = "ffw_teleop-source";
        url = "https://github.com/ros2-gbp/ai_worker-release.git";
        rev = "ab443d9d63846f2cc3a5fb5d5257e3441ed28e6b";
        hash = "sha256-WjpUtfs4CsVffuUHwdNwK3vcUEMGN52Oipib6puGwQQ=";
      };
    };
  });
  meta = {
    description = "\n    FFW teleop ROS 2 package.\n  ";
  };
})
