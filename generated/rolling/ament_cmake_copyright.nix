{
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_copyright,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_copyright = substituteSource {
      src = fetchgit {
        name = "ament_cmake_copyright-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "3eee9f480599ef84f04598846f8a30bbf085ab8c";
        hash = "sha256-zZUUCpwdbCBzUP/WpoLngFdUgSf9Heu4m6ICWhy+HJI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_copyright";
  version = "0.18.1-1";
  src = sources.ament_cmake_copyright;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_copyright ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [ ament_cmake_test ament_copyright ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_lint_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "The CMake API for ament_copyright to check every source file contains copyright reference.";
  };
}
