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
  pname = "scenario_execution_network";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."scenario_execution_network";
  propagatedNativeBuildInputs = [ scenario-execution ];
  propagatedBuildInputs = [ scenario-execution ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_network" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_network-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "15493d5ec5707b0f6319f39cb86cf0697bc61962";
        hash = "sha256-gHlsyMUxnhn8AxILWlrObOg2V7lAofj9aazLMulO6Ek=";
      };
    };
  });
  meta = {
    description = "Scenario Execution library for network functionality";
  };
})
