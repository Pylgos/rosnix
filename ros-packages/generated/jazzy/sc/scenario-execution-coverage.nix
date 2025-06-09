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
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."scenario_execution_coverage";
  propagatedNativeBuildInputs = [ scenario-execution ];
  propagatedBuildInputs = [ scenario-execution ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-defusedxml" "python3-pexpect" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_coverage" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_coverage-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "ec0be6d572899229f8f31a5d73c23fc3fd9870fc";
        hash = "sha256-DTJoH3dVA/A6LPrGS4r8Cr4DHkbEzkMCh6GYpa+Owng=";
      };
    };
  });
  meta = {
    description = "Robotics Scenario Execution Coverage Tools";
  };
})
