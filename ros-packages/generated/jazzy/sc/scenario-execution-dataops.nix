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
  pname = "scenario_execution_dataops";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."scenario_execution_dataops";
  propagatedNativeBuildInputs = [ scenario-execution ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "yaml" ]; };
  propagatedBuildInputs = [ scenario-execution ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_dataops" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_dataops-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "9b666e93d06f6f81fa0ca413b1a254024d411aa2";
        hash = "sha256-wlpUiqQjzX/qLCkH2N6nXLC8mnMwFhqTsUROM2YJ0QY=";
      };
    };
  });
  meta = {
    description = "Scenario Execution library for data operations";
  };
})
