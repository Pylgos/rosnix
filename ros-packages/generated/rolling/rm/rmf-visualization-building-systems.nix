{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rmf-building-map-msgs,
  rmf-door-msgs,
  rmf-lift-msgs,
  rmf-visualization-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rmf_visualization_building_systems";
  version = "2.5.1-1";
  src = finalAttrs.passthru.sources."rmf_visualization_building_systems";
  propagatedNativeBuildInputs = [ geometry-msgs rmf-building-map-msgs rmf-door-msgs rmf-lift-msgs rmf-visualization-msgs ];
  propagatedBuildInputs = [ geometry-msgs rmf-building-map-msgs rmf-door-msgs rmf-lift-msgs rmf-visualization-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_visualization_building_systems" = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_building_systems-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "b8f69286f0bb4f821a0c339ece3dc55f4979a788";
        hash = "sha256-tQYz0z4xzlNwuga85Wz9PQid+Q59rZV+IDG+T9E1w/A=";
      };
    };
  });
  meta = {
    description = "A visualizer for doors and lifts";
  };
})
