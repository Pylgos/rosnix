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
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."rmf_demos_gz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ gz-sim-vendor launch-xml rmf-building-sim-gz-plugins rmf-demos rmf-robot-sim-gz-plugins ros2launch ros-gz-bridge teleop-twist-keyboard ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_gz" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_gz-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "13af3f631e03dabfc7c5ffececd9645ec89aabc7";
        hash = "sha256-RnXE4UKf3EzgbVXdPx97xdP1K9CCWzWUc9rSqe3kGns=";
      };
    };
  });
  meta = {
    description = "Launch files for RMF demos using the Gazebo simulator";
  };
})
