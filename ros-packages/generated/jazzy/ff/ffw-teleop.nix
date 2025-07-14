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
  version = "1.1.7-1";
  src = finalAttrs.passthru.sources."ffw_teleop";
  propagatedNativeBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-tk" ]; };
  propagatedBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-tk" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ffw_teleop" = substituteSource {
      src = fetchgit {
        name = "ffw_teleop-source";
        url = "https://github.com/ros2-gbp/ai_worker-release.git";
        rev = "7435d077e35fa2f2311b4065d1cd5b6c0b75d658";
        hash = "sha256-IbwGw85EDXn7MwR9ppyQ1nDaMlGkKNZ5xXTHq6wl4DE=";
      };
    };
  });
  meta = {
    description = "\n    FFW teleop ROS 2 package.\n  ";
  };
})
