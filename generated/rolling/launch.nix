{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_mypy,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  osrf_pycommon,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    launch = substituteSource {
      src = fetchgit {
        name = "launch-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "d19618b3b84a5ba511d36b9f19616e3994ead69f";
        hash = "sha256-0LsFezx7DUz/GxtKUIa1tVTtwvt/z98Rzxcx22Hnpw4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch";
  version = "3.6.1-1";
  src = sources.launch;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.importlib-metadata buildPackages.python3Packages.lark buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python osrf_pycommon ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_mypy ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "The ROS launch tool.";
  };
}
