{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ffw_bringup";
  version = "1.0.9-1";
  src = finalAttrs.passthru.sources."ffw_bringup";
  passthru.sources = mkSourceSet (sources: {
    "ffw_bringup" = substituteSource {
      src = fetchgit {
        name = "ffw_bringup-source";
        url = "https://github.com/ros2-gbp/ai_worker-release.git";
        rev = "2de2652963d2cbc534385057c7b219ae8533fd1e";
        hash = "sha256-VdQZkY9MVKGDQXOSkh0C57863nkt8Q7udT+Ri7wfG1A=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 launch scripts for starting the FFW\n  ";
  };
})
