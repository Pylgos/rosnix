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
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."scenario_execution";
  propagatedNativeBuildInputs = [ py-trees ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-antlr4" "python3-yaml" ]; };
  propagatedBuildInputs = [ py-trees ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-antlr4" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution" = substituteSource {
      src = fetchgit {
        name = "scenario_execution-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "171459359a107ace00da6d989019bcb32505db97";
        hash = "sha256-A0vEcm4xtVGBOI2l0b2Pg8L5C9kUCJCK0gOTPR2NYCc=";
      };
    };
  });
  meta = {
    description = "Scenario Execution";
  };
})
