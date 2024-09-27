{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    grid_map_cmake_helpers-c3a95c8f659224e8936b341b52398b6841a69393 = substituteSource {
      src = fetchgit {
        name = "grid_map_cmake_helpers-c3a95c8f659224e8936b341b52398b6841a69393-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "c3a95c8f659224e8936b341b52398b6841a69393";
        hash = "sha256-eDT1hj+wOKMqJbOziWgmv3XwJQxTX+DgL1iQc5yhVpM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_cmake_helpers";
  version = "2.2.0-1";
  src = sources.grid_map_cmake_helpers-c3a95c8f659224e8936b341b52398b6841a69393;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "CMake support functionality used throughout grid_map";
  };
}
