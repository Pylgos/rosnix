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
    python_cmake_module = substituteSource {
      src = fetchFromGitHub {
        name = "python_cmake_module-source";
        owner = "ros2-gbp";
        repo = "python_cmake_module-release";
        rev = "2dd3d5dc5598d3993859a3131e55708310ee8fa5";
        hash = "sha256-hGj3MhMdxu3gXrz77GuQ4xIf4eBEv4/MR1NsXvZXEMU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "python_cmake_module";
  version = "0.12.0-1";
  src = sources.python_cmake_module;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  buildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provide CMake module with extra functionality for Python.";
  };
}
