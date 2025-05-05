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
  version = "2.4.1-1";
  src = finalAttrs.passthru.sources."rmf_visualization";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch-xml rmf-visualization-building-systems rmf-visualization-fleet-states rmf-visualization-floorplans rmf-visualization-navgraphs rmf-visualization-obstacles rmf-visualization-rviz2-plugins rmf-visualization-schedule ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch-xml rmf-visualization-building-systems rmf-visualization-fleet-states rmf-visualization-floorplans rmf-visualization-navgraphs rmf-visualization-obstacles rmf-visualization-rviz2-plugins rmf-visualization-schedule ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_visualization" = substituteSource {
      src = fetchgit {
        name = "rmf_visualization-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "6b922694a421e78caa7b91cba3d6c1d534e1928f";
        hash = "sha256-2DZCu6M1MQUPHZQA7IkJnejlSzKm/vZNyjO/18J5ee8=";
      };
    };
  });
  meta = {
    description = "Package containing a single launch file to bringup various visualizations";
  };
})
