{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
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
    "scenario_execution_coverage" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_coverage-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "0ed39b14124936ff3a1abf9359139d1dc233448f";
        hash = "sha256-uUGVKVodwZKOi0njDxEx29bEDkDfwjHrC+02x7blURQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentPythonPackage (finalAttrs: {
  pname = "scenario_execution_coverage";
  version = "1.2.0-4";
  src = finalAttrs.passthru.sources."scenario_execution_coverage";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ scenario-execution ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-defusedxml" "python3-pexpect" "python3-pytest" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Robotics Scenario Execution Coverage Tools";
  };
})
