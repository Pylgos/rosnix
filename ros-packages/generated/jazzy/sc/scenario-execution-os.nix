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
  pname = "scenario_execution_os";
  version = "1.2.0-5";
  src = finalAttrs.passthru.sources."scenario_execution_os";
  propagatedNativeBuildInputs = [ scenario-execution ];
  propagatedBuildInputs = [ scenario-execution ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_os" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_os-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "1ec61eb0d2bad321094e024283ada9ddbe0a3bac";
        hash = "sha256-NwNn16y/rXnUEWkjW1R08ZehDwss9ZO84nHqvLgYUTM=";
      };
    };
  });
  meta = {
    description = "Scenario Execution library for OS interactions";
  };
})
