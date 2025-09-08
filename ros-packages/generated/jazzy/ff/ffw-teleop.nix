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
  version = "1.1.11-1";
  src = finalAttrs.passthru.sources."ffw_teleop";
  propagatedNativeBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-tk" ]; };
  propagatedBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-tk" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ffw_teleop" = substituteSource {
      src = fetchgit {
        name = "ffw_teleop-source";
        url = "https://github.com/ros2-gbp/ai_worker-release.git";
        rev = "43c4a7b50d6086584a61eecbf2968c76dd48e861";
        hash = "sha256-A0Sb66r1AjmMrZcBQsUqoecRVN1tGjnGmNc/MuIkI0Y=";
      };
    };
  });
  meta = {
    description = "\n    FFW teleop ROS 2 package.\n  ";
  };
})
