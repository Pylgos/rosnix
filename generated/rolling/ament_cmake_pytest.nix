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
        rev = "1ec3b8a8583861017c37dc8fd9e39a08f18b0944";
        hash = "sha256-+XCan+0NEfJT02YjDBNxjGzEAtFDxxrSX0O1fCKip10=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_pytest";
  version = "2.7.0-1";
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
