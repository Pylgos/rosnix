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
  version = "0.17.3-1";
  src = finalAttrs.passthru.sources."ament_pep257";
  propagatedNativeBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pydocstyle" ]; };
  propagatedBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pydocstyle" ]; };
  checkInputs = [ ament-flake8 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_pep257" = substituteSource {
      src = fetchgit {
        name = "ament_pep257-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "998a84dd23e9113e582a6fa30376c3ced79a899b";
        hash = "sha256-fmTPYxVl+cI91gmd0DsUBypeC1dQ2Pnpyu836xS3v90=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check code against the docstring style conventions in\n    PEP 257 and generate xUnit test result files.\n  ";
  };
})
