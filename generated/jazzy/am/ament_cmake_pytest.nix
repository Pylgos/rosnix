{
  ament_cmake_core,
  ament_cmake_test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_pytest-fc58ed5a63f318a04230054b00827529e7bd2666 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pytest-fc58ed5a63f318a04230054b00827529e7bd2666-source";
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
  src = sources.ament_cmake_pytest-fc58ed5a63f318a04230054b00827529e7bd2666;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_test ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pytest" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_test ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ability to run Python tests using pytest in the ament buildsystem in CMake.";
  };
}
