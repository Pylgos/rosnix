{
  ament_cmake_core,
  ament_cmake_include_directories,
  ament_cmake_libraries,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_target_dependencies-20e71e7c06a7595eccc6abacae9aff75dcf0ce6b = substituteSource {
      src = fetchgit {
        name = "ament_cmake_target_dependencies-20e71e7c06a7595eccc6abacae9aff75dcf0ce6b-source";
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
  src = sources.ament_cmake_target_dependencies-20e71e7c06a7595eccc6abacae9aff75dcf0ce6b;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_include_directories ament_cmake_libraries ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_include_directories ament_cmake_libraries ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ability to add definitions, include directories and libraries of a package to a target in the ament buildsystem in CMake.";
  };
}
