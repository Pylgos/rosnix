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
        rev = "4fb8b8b075cfde8ceeefe6d3b9824c958a008a5d";
        hash = "sha256-rm7tikgeZVe6xMX1+PrCXbcZUnxAABhTumfoJY2+7YM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_testing";
  version = "3.6.1-1";
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
