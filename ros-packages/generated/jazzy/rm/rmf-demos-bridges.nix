{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmf-building-map-tools,
  rmf-fleet-msgs,
  rmf-site-map-msgs,
  rmf-traffic-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rmf_demos_bridges";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."rmf_demos_bridges";
  propagatedNativeBuildInputs = [ rmf-building-map-tools rmf-fleet-msgs rmf-site-map-msgs rmf-traffic-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-flask-socketio" "python3-paho-mqtt" "python3-pyproj" "python3-yaml" ]; };
  propagatedBuildInputs = [ rmf-building-map-tools rmf-fleet-msgs rmf-site-map-msgs rmf-traffic-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-flask-socketio" "python3-paho-mqtt" "python3-pyproj" "python3-yaml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_bridges" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_bridges-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "3f7ab553747c3c11acd90219c62bd038c6ab194d";
        hash = "sha256-Zwyo/mMxl/wdtFJszKmIH1D/f3p/3OKNCDao4xoh6VM=";
      };
    };
  });
  meta = {
    description = "Nodes for bridging between different communication stacks";
  };
})
