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
  version = "2.4.1-1";
  src = finalAttrs.passthru.sources."rmf_visualization_building_systems";
  propagatedBuildInputs = [ geometry-msgs rmf-building-map-msgs rmf-door-msgs rmf-lift-msgs rmf-visualization-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_visualization_building_systems" = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_building_systems-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "e4dbe1e632168051a340168bc3b1205577e259fa";
        hash = "sha256-zb5H/VDYMLrCtQkAUziABUWZqvLIvQjalSvS+bGKKlg=";
      };
    };
  });
  meta = {
    description = "A visualizer for doors and lifts";
  };
})
