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
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_cpplint";
  version = "0.17.5-1";
  src = finalAttrs.passthru.sources."ament_cpplint";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cpplint" = substituteSource {
      src = fetchgit {
        name = "ament_cpplint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "48f986ae15cab321ad5d91900258d997c9ad562c";
        hash = "sha256-91NJDIFOkLoKj9+qVD3XibmmCm2Da6ofvk02AQusA+M=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check code against the Google style conventions using\n    cpplint and generate xUnit test result files.";
  };
})
