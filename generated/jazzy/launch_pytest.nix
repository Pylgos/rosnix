{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  osrf_pycommon,
  substituteSource,
}:
let
  sources = rec {
    launch_pytest = substituteSource {
      src = fetchgit {
        name = "launch_pytest-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "c7496b91e9a9fa581eb4108a4d6f13a377df745b";
        hash = "sha256-pS4hgFpqm9iWHZj/NbsFhtlXbgFKyElxwA5ormakf+Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_pytest";
  version = "3.4.2-2";
  src = sources.launch_pytest;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pytest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python launch launch_testing osrf_pycommon ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 launch ];
  missingDependencies = [  ];
  meta = {
    description = "A package to create tests which involve launch files and multiple processes.";
  };
}
