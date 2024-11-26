{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  py-trees,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "scenario_execution";
  version = "1.2.0-5";
  src = finalAttrs.passthru.sources."scenario_execution";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ py-trees ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-antlr4" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution" = substituteSource {
      src = fetchgit {
        name = "scenario_execution-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "6a275064f845e547affdd21b06bf6c97dade5200";
        hash = "sha256-XlhKnH0DM2rt1LeexkMw+kVKxSNTw+0SSYQmpT5AezQ=";
      };
    };
  });
  meta = {
    description = "Scenario Execution";
  };
})
