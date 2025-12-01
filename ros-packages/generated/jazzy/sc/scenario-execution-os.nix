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
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."scenario_execution_os";
  propagatedNativeBuildInputs = [ scenario-execution ];
  propagatedBuildInputs = [ scenario-execution ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_os" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_os-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "1161c8e3ecc6a3252fa4e8890642d53f8eea7532";
        hash = "sha256-95/KKVssrSHuoj+TDwEtdgTHIv3fpIhUVpohYAkjAf8=";
      };
    };
  });
  meta = {
    description = "Scenario Execution library for OS interactions";
  };
})
