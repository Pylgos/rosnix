{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    rmw_implementation_cmake = substituteSource {
      src = fetchgit {
        name = "rmw_implementation_cmake-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
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
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "CMake functions which can discover and enumerate available implementations.";
  };
}
