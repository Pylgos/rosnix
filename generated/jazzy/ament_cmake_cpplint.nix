{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cpplint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_cpplint = substituteSource {
      src = fetchgit {
        name = "ament_cmake_cpplint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "d2d1a8273bf0a2d803a1888153ce6bebc766162f";
        hash = "sha256-pBDS27G8OZtNMGWRys5PY5uEpQLUn8qWxAiT02sJa9Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_cpplint";
  version = "0.17.1-1";
  src = sources.ament_cmake_cpplint;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_cpplint ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [ ament_cmake_test ament_cpplint ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "The CMake API for ament_cpplint to lint C / C++ code using cpplint.";
  };
}
