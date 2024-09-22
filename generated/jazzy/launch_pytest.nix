{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  osrf_pycommon,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    launch_pytest = substituteSource {
      src = fetchFromGitHub {
        name = "launch_pytest-source";
        owner = "ros2-gbp";
        repo = "launch-release";
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
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pytest" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python launch launch_testing osrf_pycommon ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 launch ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package to create tests which involve launch files and multiple processes.";
  };
}
