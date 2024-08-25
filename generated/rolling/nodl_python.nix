{
  ament_flake8,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  ament_mypy,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    nodl_python = substituteSource {
      src = fetchgit {
        name = "nodl_python-source";
        url = "https://github.com/ros2-gbp/nodl-release.git";
        rev = "b699bd8f49e8cd26b642940300bdecdc79a5a2c7";
        hash = "sha256-rHEAtKnNTsXSB1UGfZYRfy3DQXrnGFWNntTfJyxEymc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nodl_python";
  version = "0.3.1-4";
  src = sources.nodl_python;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python python3Packages.lxml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_flake8 ament_lint_auto ament_lint_common ament_mypy python3Packages.pytest python3Packages.pytest-mock ];
  missingDependencies = [  ];
  meta = {
    description = "Implementation of the NoDL API in Python.";
  };
}
