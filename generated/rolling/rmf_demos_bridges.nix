{
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rmf_building_map_tools,
  rmf_fleet_msgs,
  rmf_site_map_msgs,
  rmf_traffic_msgs,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rmf_demos_bridges = substituteSource {
      src = fetchFromGitHub {
        name = "rmf_demos_bridges-source";
        owner = "ros2-gbp";
        repo = "rmf_demos-release";
        rev = "978b6c6be51afc57a366eb9f9d928c2855588e2f";
        hash = "sha256-0nscD2U92Qris4yYxOJ0bnuSQzxmbhLUYTq7lKEOkSw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_demos_bridges";
  version = "2.4.0-1";
  src = sources.rmf_demos_bridges;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rmf_building_map_tools rmf_fleet_msgs rmf_site_map_msgs rmf_traffic_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-flask-socketio" "python3-paho-mqtt" "python3-pyproj" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Nodes for bridging between different communication stacks";
  };
}
