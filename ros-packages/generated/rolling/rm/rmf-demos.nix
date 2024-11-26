{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-xml,
  mkSourceSet,
  rmf-building-map-tools,
  rmf-demos-assets,
  rmf-demos-fleet-adapter,
  rmf-demos-maps,
  rmf-demos-tasks,
  rmf-fleet-adapter,
  rmf-task-ros2,
  rmf-traffic-ros2,
  rmf-visualization,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_demos";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."rmf_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ launch-xml rmf-building-map-tools rmf-demos-assets rmf-demos-fleet-adapter rmf-demos-maps rmf-demos-tasks rmf-fleet-adapter rmf-task-ros2 rmf-traffic-ros2 rmf-visualization rviz2 ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmf_demos" = substituteSource {
        src = fetchgit {
          name = "rmf_demos-source";
          url = "https://github.com/ros2-gbp/rmf_demos-release.git";
          rev = "a4adcf382443e25aa205630ed14fb126e95c3b3a";
          hash = "sha256-Eqxl47veB826oMBkeGleZfr/J8uO5bBruT9ZftBpB1Q=";
        };
      };
    });
  };
  meta = {
    description = "Common launch files for RMF demos";
  };
})
