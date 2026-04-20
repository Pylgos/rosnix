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
  version = "0.20.4-1";
  src = finalAttrs.passthru.sources."ament_pep257";
  propagatedNativeBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pydocstyle" ]; };
  propagatedBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pydocstyle" ]; };
  checkInputs = [ ament-flake8 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_pep257" = substituteSource {
      src = fetchgit {
        name = "ament_pep257-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "5fbbebc925b9a7a6947cb01860c9d22e8e89b6ad";
        hash = "sha256-oEvxNipEa9QjLCsyL5cWtDpwb7XDVrls8kwbFlfLp7w=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check code against the docstring style conventions in\n    PEP 257 and generate xUnit test result files.\n  ";
  };
})
