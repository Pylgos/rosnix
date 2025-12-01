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
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."scenario_execution_coverage";
  propagatedNativeBuildInputs = [ scenario-execution ];
  propagatedBuildInputs = [ scenario-execution ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-defusedxml" "python3-pexpect" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_coverage" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_coverage-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "7c92bc11af07be696e35e152a2531fe2956104a8";
        hash = "sha256-5bfct6B3mbPSkW00+EQ7va1aUFzmFsPLHT4md+9f/4A=";
      };
    };
  });
  meta = {
    description = "Robotics Scenario Execution Coverage Tools";
  };
})
