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
        rev = "20e71e7c06a7595eccc6abacae9aff75dcf0ce6b";
        hash = "sha256-c+d56mCQKkjI9H5j8MPgUKeP1SUkn1HGUo/sIGYd5gQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_target_dependencies";
  version = "2.5.2-1";
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
