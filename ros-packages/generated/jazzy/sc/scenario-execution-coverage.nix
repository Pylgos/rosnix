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
buildAmentPythonPackage (finalAttrs: {
  pname = "scenario_execution_coverage";
  version = "1.2.0-5";
  src = finalAttrs.passthru.sources."scenario_execution_coverage";
  propagatedNativeBuildInputs = [ scenario-execution ];
  propagatedBuildInputs = [ scenario-execution ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-defusedxml" "python3-pexpect" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_coverage" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_coverage-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "3a84ec826447f4748a84012c8121b64478552e97";
        hash = "sha256-uUGVKVodwZKOi0njDxEx29bEDkDfwjHrC+02x7blURQ=";
      };
    };
  });
  meta = {
    description = "Robotics Scenario Execution Coverage Tools";
  };
})
