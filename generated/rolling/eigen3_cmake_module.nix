{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_lint_cmake,
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
    eigen3_cmake_module = substituteSource {
      src = fetchFromGitHub {
        name = "eigen3_cmake_module-source";
        owner = "ros2-gbp";
        repo = "eigen3_cmake_module-release";
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
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Exports a custom CMake module to find Eigen3.";
  };
}
