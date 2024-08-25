{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rmf_building_map_tools,
  rmf_fleet_msgs,
  rmf_site_map_msgs,
  rmf_traffic_msgs,
  substituteSource,
}:
let
  sources = rec {
    rmf_demos_bridges = substituteSource {
      src = fetchgit {
        name = "rmf_demos_bridges-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
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
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.pyproj rmf_building_map_tools rmf_fleet_msgs rmf_site_map_msgs rmf_traffic_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "python3-flask-socketio" "python3-paho-mqtt" ];
  meta = {
    description = "Nodes for bridging between different communication stacks";
  };
}
