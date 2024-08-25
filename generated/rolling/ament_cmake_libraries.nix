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
        rev = "f67fc32b45d2d70d45ef526130124f72672f72d4";
        hash = "sha256-BJes6zPbdJuktsjN6pgmSsW7+WpETcb3/hNhtIrAOeo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_libraries";
  version = "2.7.0-1";
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
