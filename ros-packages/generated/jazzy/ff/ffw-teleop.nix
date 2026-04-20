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
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."ffw_teleop";
  propagatedNativeBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-tk" ]; };
  propagatedBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-tk" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ffw_teleop" = substituteSource {
      src = fetchgit {
        name = "ffw_teleop-source";
        url = "https://github.com/ros2-gbp/ai_worker-release.git";
        rev = "1f29a10d2db3f4231b780977411f918929b43e86";
        hash = "sha256-OJE2a+ANhJmz2V0+pwn/Bcshp8b4seKF4xcpR7nHTr4=";
      };
    };
  });
  meta = {
    description = "\n    FFW teleop ROS 2 package.\n  ";
  };
})
