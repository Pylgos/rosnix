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
  version = "0.19.1-1";
  src = finalAttrs.passthru.sources."ament_pep257";
  propagatedNativeBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pydocstyle" ]; };
  propagatedBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pydocstyle" ]; };
  checkInputs = [ ament-flake8 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_pep257" = substituteSource {
      src = fetchgit {
        name = "ament_pep257-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "9f66b44c43285695ec232814a8dd30046aac857b";
        hash = "sha256-E7dwAqhmMbzrZpySpQ4RHQdznqZDws3WrlPPCCgd3ms=";
      };
    };
  });
  meta = {
    description = "The ability to check code against the docstring style conventions in PEP 257 and generate xUnit test result files.";
  };
})
