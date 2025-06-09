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
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."scenario_execution_os";
  propagatedNativeBuildInputs = [ scenario-execution ];
  propagatedBuildInputs = [ scenario-execution ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_os" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_os-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "2f916e0c58e350cb280296405cd3f78b8c1daa06";
        hash = "sha256-1tczTgtjMH4GSyB8pW1w0Zno0pwX3U2jboqK477IlRI=";
      };
    };
  });
  meta = {
    description = "Scenario Execution library for OS interactions";
  };
})
