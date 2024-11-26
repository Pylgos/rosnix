{
  ament-flake8,
  ament-lint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_pep257";
  version = "0.19.0-1";
  src = finalAttrs.passthru.sources."ament_pep257";
  propagatedNativeBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pydocstyle" ]; };
  propagatedBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pydocstyle" ]; };
  checkInputs = [ ament-flake8 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_pep257" = substituteSource {
      src = fetchgit {
        name = "ament_pep257-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "ed3f1e616a53d2c98aa90bc03e0dccca9080b673";
        hash = "sha256-imxtC4Fk7qpFS9vuPskAOTC4e0ol9/pldTRxk0hgm8g=";
      };
    };
  });
  meta = {
    description = "The ability to check code against the docstring style conventions in PEP 257 and generate xUnit test result files.";
  };
})
