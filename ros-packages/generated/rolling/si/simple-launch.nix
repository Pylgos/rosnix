{
  ament-cmake-python,
  ament-index-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "simple_launch";
  version = "1.11.0-1";
  src = finalAttrs.passthru.sources."simple_launch";
  nativeBuildInputs = [ ament-cmake-python ];
  propagatedBuildInputs = [ ament-index-python launch launch-ros xacro ];
  passthru.sources = mkSourceSet (sources: {
    "simple_launch" = substituteSource {
      src = fetchgit {
        name = "simple_launch-source";
        url = "https://github.com/ros2-gbp/simple_launch-release.git";
        rev = "777266ed505176fa0e954990c10d5885150b8fd4";
        hash = "sha256-nooyhG3FLVS0v5ZWC3VRyTvfs4+nFHuPEPG+Tln6cEw=";
      };
    };
  });
  meta = {
    description = "Python helper class for the ROS 2 launch system";
  };
})
