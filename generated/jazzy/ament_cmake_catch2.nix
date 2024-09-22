{
  ament_cmake_core,
  ament_cmake_test,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_catch2 = substituteSource {
      src = fetchFromGitHub {
        name = "ament_cmake_catch2-source";
        owner = "ros2-gbp";
        repo = "ament_cmake_catch2-release";
        rev = "99c9bf4fa0edf16c1ea0099598cf03eeb6793d6b";
        hash = "sha256-PFP5trdCmO4MmGg8CFeK0nTgMWRn+XQN2Z92TWyddYk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_catch2";
  version = "1.4.1-1";
  src = sources.ament_cmake_catch2;
  nativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_test ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Allows integrating catch2 tests in the ament buildsystem with CMake";
  };
}
