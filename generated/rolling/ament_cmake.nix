{
  ament_cmake_core,
  ament_cmake_export_definitions,
  ament_cmake_export_dependencies,
  ament_cmake_export_include_directories,
  ament_cmake_export_interfaces,
  ament_cmake_export_libraries,
  ament_cmake_export_link_flags,
  ament_cmake_export_targets,
  ament_cmake_gen_version_h,
  ament_cmake_libraries,
  ament_cmake_python,
  ament_cmake_target_dependencies,
  ament_cmake_test,
  ament_cmake_version,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake = substituteSource {
      src = fetchgit {
        name = "ament_cmake-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "ddde4d2ccd905dd054180794faa0cd68fa915388";
        hash = "sha256-6RLlDEd89h7WUPXZVied1O0EKmJuxpiFfHmEERB6dfY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake";
  version = "2.7.0-1";
  src = sources.ament_cmake;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_export_definitions ament_cmake_export_dependencies ament_cmake_export_include_directories ament_cmake_export_interfaces ament_cmake_export_libraries ament_cmake_export_link_flags ament_cmake_export_targets ament_cmake_gen_version_h ament_cmake_libraries ament_cmake_python ament_cmake_target_dependencies ament_cmake_test ament_cmake_version cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_export_definitions ament_cmake_export_dependencies ament_cmake_export_include_directories ament_cmake_export_interfaces ament_cmake_export_libraries ament_cmake_export_link_flags ament_cmake_export_targets ament_cmake_gen_version_h ament_cmake_libraries ament_cmake_python ament_cmake_target_dependencies ament_cmake_test ament_cmake_version cmake ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The entry point package for the ament buildsystem in CMake.";
  };
}
