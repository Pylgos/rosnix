{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  scenario-execution,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "scenario_execution_os" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_os-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "c02277b6a4df558f49694a1e0d69a5c986db504e";
        hash = "sha256-NwNn16y/rXnUEWkjW1R08ZehDwss9ZO84nHqvLgYUTM=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "scenario_execution_os";
  version = "1.2.0-3";
  src = sources."scenario_execution_os";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ scenario-execution ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Scenario Execution library for OS interactions";
  };
}
