{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_mypy,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_mypy = substituteSource {
      src = fetchgit {
        name = "ament_cmake_mypy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "91810f41709319202fbfcff3e05e295b6f1962af";
        hash = "sha256-HW+csb772XRl3wyN41cpciuG2mw8Jbek4OMYsrY2hVc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_mypy";
  version = "0.18.1-1";
  src = sources.ament_cmake_mypy;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_mypy ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "The CMake API for ament_mypy to perform static type analysis on python code with mypy.";
  };
}
