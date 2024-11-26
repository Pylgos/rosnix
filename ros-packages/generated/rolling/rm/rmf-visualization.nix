{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-xml,
  mkSourceSet,
  rmf-visualization-building-systems,
  rmf-visualization-fleet-states,
  rmf-visualization-floorplans,
  rmf-visualization-navgraphs,
  rmf-visualization-obstacles,
  rmf-visualization-rviz2-plugins,
  rmf-visualization-schedule,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_visualization";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."rmf_visualization";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ launch-xml rmf-visualization-building-systems rmf-visualization-fleet-states rmf-visualization-floorplans rmf-visualization-navgraphs rmf-visualization-obstacles rmf-visualization-rviz2-plugins rmf-visualization-schedule ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmf_visualization" = substituteSource {
        src = fetchgit {
          name = "rmf_visualization-source";
          url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
          rev = "cc28d9e8d0e9f0ccf102603351fb4713a642fd1c";
          hash = "sha256-MCeRrB8BvUy3X+TuoVbb27JAYaZvwXhm1Zi7Ylk4PkQ=";
        };
      };
    });
  };
  meta = {
    description = "Package containing a single launch file to bringup various visualizations";
  };
})
