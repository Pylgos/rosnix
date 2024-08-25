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
