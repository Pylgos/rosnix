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
    rmf_traffic_editor_test_maps = substituteSource {
      src = fetchFromGitHub {
        name = "rmf_traffic_editor_test_maps-source";
        owner = "ros2-gbp";
        repo = "rmf_traffic_editor-release";
        rev = "fadcef4b2ef042ca119316e47436a1227b9cace9";
        hash = "sha256-eJA96biS2Ot6mX0fVe9kZHyB606Fpd++OBq/UY0ssVM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_traffic_editor_test_maps";
  version = "1.10.0-1";
  src = sources.rmf_traffic_editor_test_maps;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [ rmf_building_map_tools ros2run ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Some test maps for traffic_editor and rmf_building_map_tools.";
  };
}
