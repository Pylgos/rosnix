{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
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
    rmw_implementation_cmake = substituteSource {
      src = fetchFromGitHub {
        name = "rmw_implementation_cmake-source";
        owner = "ros2-gbp";
        repo = "rmw-release";
        rev = "7e0cca826ec27a0fe05672ed366b35468b492adb";
        hash = "sha256-aXrzFTM5hESGOTN25ojbzGxw19rcwTsGhCqCqAiDLz0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_implementation_cmake";
  version = "7.3.1-1";
  src = sources.rmw_implementation_cmake;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "CMake functions which can discover and enumerate available implementations.";
  };
}
