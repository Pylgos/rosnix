{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rmf_building_map_msgs,
  rmf_door_msgs,
  rmf_lift_msgs,
  rmf_visualization_msgs,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rmf_visualization_building_systems = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_building_systems-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "091dd4ddd3de80bb08af0af8e10b88da60072c77";
        hash = "sha256-lTaY75owEt1+2JAjgITJGaf9qqpBv0Lkc+D9WhneXp8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_building_systems";
  version = "2.4.0-1";
  src = sources.rmf_visualization_building_systems;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rmf_building_map_msgs rmf_door_msgs rmf_lift_msgs rmf_visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "A visualizer for doors and lifts";
  };
}
