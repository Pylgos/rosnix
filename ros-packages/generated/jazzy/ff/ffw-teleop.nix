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
  version = "1.1.9-1";
  src = finalAttrs.passthru.sources."ffw_teleop";
  propagatedNativeBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-tk" ]; };
  propagatedBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-tk" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ffw_teleop" = substituteSource {
      src = fetchgit {
        name = "ffw_teleop-source";
        url = "https://github.com/ros2-gbp/ai_worker-release.git";
        rev = "bc0fe70c631fe3d68c090540e6cb95e6a4bb1ccb";
        hash = "sha256-qYbMkKbkMgq0VPdbEJHIb1xd8iRvLuOOaloeOsLj7lo=";
      };
    };
  });
  meta = {
    description = "\n    FFW teleop ROS 2 package.\n  ";
  };
})
