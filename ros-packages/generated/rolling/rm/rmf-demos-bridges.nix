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
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."rmf_demos_bridges";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ rmf-building-map-tools rmf-fleet-msgs rmf-site-map-msgs rmf-traffic-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-flask-socketio" "python3-paho-mqtt" "python3-pyproj" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_bridges" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_bridges-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "0358fe4804d336161f1fd0c8529750d794bf7e57";
        hash = "sha256-IPOAxDAHsPcofiEKDMx4t8n/Fu7yqO/D58zH180Hy0Q=";
      };
    };
  });
  meta = {
    description = "Nodes for bridging between different communication stacks";
  };
})
