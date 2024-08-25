{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3,
  substituteSource,
}:
let
  sources = rec {
    python_cmake_module = substituteSource {
      src = fetchgit {
        name = "python_cmake_module-source";
        url = "https://github.com/ros2-gbp/python_cmake_module-release.git";
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
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ python3 ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [ python3 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Provide CMake module with extra functionality for Python.";
  };
}
