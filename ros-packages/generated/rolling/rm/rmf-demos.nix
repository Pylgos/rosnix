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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_demos";
  version = "2.8.1-2";
  src = finalAttrs.passthru.sources."rmf_demos";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ launch-xml rmf-building-map-tools rmf-demos-assets rmf-demos-fleet-adapter rmf-demos-maps rmf-demos-tasks rmf-fleet-adapter rmf-reservation-node rmf-task-ros2 rmf-traffic-ros2 rmf-visualization rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch-xml rmf-building-map-tools rmf-demos-assets rmf-demos-fleet-adapter rmf-demos-maps rmf-demos-tasks rmf-fleet-adapter rmf-reservation-node rmf-task-ros2 rmf-traffic-ros2 rmf-visualization rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos" = substituteSource {
      src = fetchgit {
        name = "rmf_demos-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "22d8027acf37953783e1f71435b482e334d3fca8";
        hash = "sha256-SOO4qwu4jSrKAKwcWs5ZgP7jRIQ8xkxylquzn/DWHp8=";
      };
    };
  });
  meta = {
    description = "Common launch files for RMF demos";
  };
})
