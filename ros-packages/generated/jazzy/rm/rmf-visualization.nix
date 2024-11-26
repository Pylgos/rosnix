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
  version = "2.3.2-1";
  src = finalAttrs.passthru.sources."rmf_visualization";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ launch-xml rmf-visualization-building-systems rmf-visualization-fleet-states rmf-visualization-floorplans rmf-visualization-navgraphs rmf-visualization-obstacles rmf-visualization-rviz2-plugins rmf-visualization-schedule ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_visualization" = substituteSource {
      src = fetchgit {
        name = "rmf_visualization-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "7425f0eec9cfae30f755539a7e3ff8c4e99c6736";
        hash = "sha256-Yf6tYLAXIEZoxfZmTA0Wxl67vp5SeI90iIog9NWMJvw=";
      };
    };
  });
  meta = {
    description = "Package containing a single launch file to bringup various visualizations";
  };
})
