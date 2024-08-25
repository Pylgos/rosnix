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
  octomap,
  substituteSource,
}:
let
  sources = rec {
    grid_map_octomap = substituteSource {
      src = fetchgit {
        name = "grid_map_octomap-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "5ade9fc283da6134d112a0bddee5344a7b707aeb";
        hash = "sha256-XOSuh3xDRe5V70xnIa3O6/ix3PDcno0efxX9BAxWWFs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_octomap";
  version = "2.2.0-1";
  src = sources.grid_map_octomap;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ grid_map_cmake_helpers grid_map_core octomap ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Conversions between grid maps and OctoMap types.";
  };
}
