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
  version = "2.3.2-1";
  src = finalAttrs.passthru.sources."rmf_visualization_building_systems";
  propagatedNativeBuildInputs = [ geometry-msgs rmf-building-map-msgs rmf-door-msgs rmf-lift-msgs rmf-visualization-msgs ];
  propagatedBuildInputs = [ geometry-msgs rmf-building-map-msgs rmf-door-msgs rmf-lift-msgs rmf-visualization-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_visualization_building_systems" = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_building_systems-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "e3075e116978d6ef9e3d17dc6aef0c7d208c65d9";
        hash = "sha256-F8cP3CB2QRr8ckFPE9e5dKeGDcdZZ/vtif3MnTVg+5g=";
      };
    };
  });
  meta = {
    description = "A visualizer for doors and lifts";
  };
})
