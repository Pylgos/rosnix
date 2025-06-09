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
  version = "1.0.8-1";
  src = finalAttrs.passthru.sources."ffw_bringup";
  passthru.sources = mkSourceSet (sources: {
    "ffw_bringup" = substituteSource {
      src = fetchgit {
        name = "ffw_bringup-source";
        url = "https://github.com/ros2-gbp/ai_worker-release.git";
        rev = "3e6538e5ec089f2a9ce559a02590c9a52b2e74b6";
        hash = "sha256-DuzDgDQYQ1mnYHmXc9oHzSAg/kQbhVm6y2vyn3Vs+FY=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 launch scripts for starting the FFW\n  ";
  };
})
