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
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."rmf_demos_bridges";
  propagatedNativeBuildInputs = [ rmf-building-map-tools rmf-fleet-msgs rmf-site-map-msgs rmf-traffic-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-flask-socketio" "python3-paho-mqtt" "python3-pyproj" "python3-yaml" ]; };
  propagatedBuildInputs = [ rmf-building-map-tools rmf-fleet-msgs rmf-site-map-msgs rmf-traffic-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-flask-socketio" "python3-paho-mqtt" "python3-pyproj" "python3-yaml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_bridges" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_bridges-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "6fb459beb7e4028133402807b45945d61586d043";
        hash = "sha256-fwQpUByrXVF4ay+PL1U++tvnxAlyOsz0vt8egwUpVTU=";
      };
    };
  });
  meta = {
    description = "Nodes for bridging between different communication stacks";
  };
})
