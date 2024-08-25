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
  launch_xml,
  launch_yaml,
  osrf_pycommon,
  substituteSource,
}:
let
  sources = rec {
    launch_testing = substituteSource {
      src = fetchgit {
        name = "launch_testing-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "b79367de3cd844ef48059d8e4b91ebe48ec9535d";
        hash = "sha256-e6Zfr3gooc/K16iYNLOe8NrtH2ikKvKRBQGka3T0Jm8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_testing";
  version = "3.4.2-2";
  src = sources.launch_testing;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pytest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python launch launch_xml launch_yaml osrf_pycommon ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 launch ];
  missingDependencies = [  ];
  meta = {
    description = "A package to create tests which involve launch files and multiple processes.";
  };
}
