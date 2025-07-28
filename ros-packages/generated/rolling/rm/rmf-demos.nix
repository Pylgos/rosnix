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
  rmf-reservation-node,
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
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."rmf_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch-xml rmf-building-map-tools rmf-demos-assets rmf-demos-fleet-adapter rmf-demos-maps rmf-demos-tasks rmf-fleet-adapter rmf-reservation-node rmf-task-ros2 rmf-traffic-ros2 rmf-visualization rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch-xml rmf-building-map-tools rmf-demos-assets rmf-demos-fleet-adapter rmf-demos-maps rmf-demos-tasks rmf-fleet-adapter rmf-reservation-node rmf-task-ros2 rmf-traffic-ros2 rmf-visualization rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos" = substituteSource {
      src = fetchgit {
        name = "rmf_demos-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "19308c498f157c79171e1b811b18ec1c94015ddb";
        hash = "sha256-5WgedeYCeM1waHpfE977S8Mo+10rtG80feP/fDIFFXw=";
      };
    };
  });
  meta = {
    description = "Common launch files for RMF demos";
  };
})
