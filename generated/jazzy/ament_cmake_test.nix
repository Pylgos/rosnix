{
  ament_cmake_core,
  ament_cmake_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_test = substituteSource {
      src = fetchgit {
        name = "ament_cmake_test-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "4a2003a2e58c6c07a8c787f049431907f2c95d5d";
        hash = "sha256-RKywy1QY2j4gqIjiM79unPTrERgcjW3AdJihPKnwYpk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_test";
  version = "2.5.2-1";
  src = sources.ament_cmake_test;
  nativeBuildInputs = [ ament_cmake_python ];
  propagatedNativeBuildInputs = [ ament_cmake_core ];
  buildInputs = [ ament_cmake_python ];
  propagatedBuildInputs = [ ament_cmake_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to add tests in the ament buildsystem in CMake.";
  };
}
