{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rmf_building_map_tools,
  ros2run,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rmf_demos_maps = substituteSource {
      src = fetchFromGitHub {
        name = "rmf_demos_maps-source";
        owner = "ros2-gbp";
        repo = "rmf_demos-release";
        rev = "44a07da1995bebe0c7f85ab3aeb9e51d0297575d";
        hash = "sha256-k6hNNgOSOVtmGt41Ps9lNg8RHEdUn3Qo5yne9ucQPH0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_demos_maps";
  version = "2.4.0-1";
  src = sources.rmf_demos_maps;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [ rmf_building_map_tools ros2run ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing demo maps for rmf";
  };
}
