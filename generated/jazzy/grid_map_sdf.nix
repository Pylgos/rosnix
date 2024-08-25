{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  grid_map_cmake_helpers,
  grid_map_core,
  pcl,
  substituteSource,
}:
let
  sources = rec {
    grid_map_sdf = substituteSource {
      src = fetchgit {
        name = "grid_map_sdf-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "e0edb03fc06d1afe46a6f68f735c12b588073966";
        hash = "sha256-xaVPI1GG4agH0Va8y03KPbPJFZ9qVyoOjT4F+ukjWWk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_sdf";
  version = "2.2.0-1";
  src = sources.grid_map_sdf;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ grid_map_cmake_helpers grid_map_core pcl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Generates signed distance fields from grid maps.";
  };
}
