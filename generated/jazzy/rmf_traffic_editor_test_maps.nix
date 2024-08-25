{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rmf_building_map_tools,
  ros2run,
  substituteSource,
}:
let
  sources = rec {
    rmf_traffic_editor_test_maps = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_editor_test_maps-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "0cae53184649ffa92ff7f95414420d400f872d35";
        hash = "sha256-+CyU4MrWaOGPsEtm5SXBONfFEeg5kLfRAu+zuSx4nbo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_traffic_editor_test_maps";
  version = "1.9.1-1";
  src = sources.rmf_traffic_editor_test_maps;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ rmf_building_map_tools ros2run ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Some test maps for traffic_editor and rmf_building_map_tools.";
  };
}
