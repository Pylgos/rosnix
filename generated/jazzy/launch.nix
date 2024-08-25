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
        rev = "196ad94e0bdbb2865e27b660917f7d4a2e15cf72";
        hash = "sha256-4r3hs/NhnD3VtuC0Io5xDtYqSnhHjRcfJf8xpbEJKWk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch";
  version = "3.4.2-2";
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
