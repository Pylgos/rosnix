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
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."rmf_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch-xml rmf-building-map-tools rmf-demos-assets rmf-demos-fleet-adapter rmf-demos-maps rmf-demos-tasks rmf-fleet-adapter rmf-task-ros2 rmf-traffic-ros2 rmf-visualization rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch-xml rmf-building-map-tools rmf-demos-assets rmf-demos-fleet-adapter rmf-demos-maps rmf-demos-tasks rmf-fleet-adapter rmf-task-ros2 rmf-traffic-ros2 rmf-visualization rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos" = substituteSource {
      src = fetchgit {
        name = "rmf_demos-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "ec55a8e950f439d10bca53af7b1d49396c5b3b15";
        hash = "sha256-Sq1zwjFV7PwoIuqszST19MXV2hyXqpNTcE+tuMZxjRg=";
      };
    };
  });
  meta = {
    description = "Common launch files for RMF demos";
  };
})
