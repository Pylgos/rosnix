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
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."rmf_demos_gz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gz-sim-vendor launch-xml rmf-building-sim-gz-plugins rmf-demos rmf-robot-sim-gz-plugins ros2launch ros-gz-bridge teleop-twist-keyboard ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gz-sim-vendor launch-xml rmf-building-sim-gz-plugins rmf-demos rmf-robot-sim-gz-plugins ros2launch ros-gz-bridge teleop-twist-keyboard ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_gz" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_gz-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "5e434b1fb10830a0e551ab6257cde5b861e3217c";
        hash = "sha256-SQs6C3eVK2f40He6fEUT3TS6Y4E1y28e+bOOBFuPQs8=";
      };
    };
  });
  meta = {
    description = "Launch files for RMF demos using the Gazebo simulator";
  };
})
