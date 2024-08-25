{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python3Packages,
  rmf_building_map_msgs,
  rmf_door_msgs,
  rmf_lift_msgs,
  rmf_visualization_msgs,
  substituteSource,
}:
let
  sources = rec {
    rmf_visualization_building_systems = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_building_systems-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "e3075e116978d6ef9e3d17dc6aef0c7d208c65d9";
        hash = "sha256-F8cP3CB2QRr8ckFPE9e5dKeGDcdZZ/vtif3MnTVg+5g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_building_systems";
  version = "2.3.2-1";
  src = sources.rmf_visualization_building_systems;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rmf_building_map_msgs rmf_door_msgs rmf_lift_msgs rmf_visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "A visualizer for doors and lifts";
  };
}
