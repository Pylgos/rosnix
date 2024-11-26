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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."rmf_visualization_building_systems";
  propagatedBuildInputs = [ geometry-msgs rmf-building-map-msgs rmf-door-msgs rmf-lift-msgs rmf-visualization-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "rmf_visualization_building_systems" = substituteSource {
        src = fetchgit {
          name = "rmf_visualization_building_systems-source";
          url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
          rev = "091dd4ddd3de80bb08af0af8e10b88da60072c77";
          hash = "sha256-lTaY75owEt1+2JAjgITJGaf9qqpBv0Lkc+D9WhneXp8=";
        };
      };
    });
  };
  meta = {
    description = "A visualizer for doors and lifts";
  };
})
