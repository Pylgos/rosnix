{
  ament_cmake_core,
  ament_cmake_test,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_pytest = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pytest-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "fc58ed5a63f318a04230054b00827529e7bd2666";
        hash = "sha256-EvqH8/HvE1+IJq3aMPtqxAAhZ2i80nVL92brdBZ9OlA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_pytest";
  version = "2.5.2-1";
  src = sources.ament_cmake_pytest;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_test buildPackages.python3Packages.pytest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_test python3Packages.pytest ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to run Python tests using pytest in the ament buildsystem in CMake.";
  };
}
