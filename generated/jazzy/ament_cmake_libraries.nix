{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_libraries = substituteSource {
      src = fetchgit {
        name = "ament_cmake_libraries-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "4f19452769a2137a73e98f1af2a4da29d907fbd3";
        hash = "sha256-qPsh1jLploxTcx7YSm921jfl/hTLS7rfyYoeg8VB8g4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_libraries";
  version = "2.5.2-1";
  src = sources.ament_cmake_libraries;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The functionality to deduplicate libraries in the ament buildsystem in CMake.";
  };
}
