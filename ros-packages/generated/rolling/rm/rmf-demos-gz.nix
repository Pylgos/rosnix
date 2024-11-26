{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-sim-vendor,
  launch-xml,
  mkSourceSet,
  rmf-building-sim-gz-plugins,
  rmf-demos,
  rmf-robot-sim-gz-plugins,
  ros-gz-bridge,
  ros2launch,
  rosSystemPackages,
  substituteSource,
  teleop-twist-keyboard,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_demos_gz";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."rmf_demos_gz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ gz-sim-vendor launch-xml rmf-building-sim-gz-plugins rmf-demos rmf-robot-sim-gz-plugins ros2launch ros-gz-bridge teleop-twist-keyboard ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_gz" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_gz-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "29c18cb399ba028da1a30cbca69082981b52a770";
        hash = "sha256-t3SCEaDdsSY779uKQlTe7KpS+QNfowrHfD3Yrn46cd8=";
      };
    };
  });
  meta = {
    description = "Launch files for RMF demos using the Gazebo simulator";
  };
})
