{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  grid_map_cmake_helpers,
  substituteSource,
}:
let
  sources = rec {
    grid_map_core = substituteSource {
      src = fetchgit {
        name = "grid_map_core-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "62a7d5dbc8dac1525797c562015107125df608b5";
        hash = "sha256-9aVbWWdPmtYwrYhuIxr84Ft0dddBBrOP3ZUbBrz4TXE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_core";
  version = "2.2.0-1";
  src = sources.grid_map_core;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen grid_map_cmake_helpers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Universal grid map library to manage two-dimensional grid maps with multiple data layers.";
  };
}
