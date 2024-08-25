{
  ament_cmake_core,
  ament_cmake_include_directories,
  ament_cmake_libraries,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_target_dependencies = substituteSource {
      src = fetchgit {
        name = "ament_cmake_target_dependencies-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "cde5365acc1c9e9d0e1dd7a62982b6e23cb47baf";
        hash = "sha256-pd+SRhXw2GI/r2HTnNf1u/ay+ydgaRFq7DGsnzG4pBU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_target_dependencies";
  version = "2.7.0-1";
  src = sources.ament_cmake_target_dependencies;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_include_directories ament_cmake_libraries ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_include_directories ament_cmake_libraries ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to add definitions, include directories and libraries of a package to a target in the ament buildsystem in CMake.";
  };
}
