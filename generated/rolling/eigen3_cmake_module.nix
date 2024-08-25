{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_lint_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    eigen3_cmake_module = substituteSource {
      src = fetchgit {
        name = "eigen3_cmake_module-source";
        url = "https://github.com/ros2-gbp/eigen3_cmake_module-release.git";
        rev = "cc75f807bbc52d044c86fdfc4c7a8e075a1ddf53";
        hash = "sha256-KQUVSjAi9dDk9itOgrGGMWYE4MHIltisCQbFFcE2ZQE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "eigen3_cmake_module";
  version = "0.4.0-1";
  src = sources.eigen3_cmake_module;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "Exports a custom CMake module to find Eigen3.";
  };
}
