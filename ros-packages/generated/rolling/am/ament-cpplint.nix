{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
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
  version = "0.19.2-1";
  src = finalAttrs.passthru.sources."ament_cpplint";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cpplint" = substituteSource {
      src = fetchgit {
        name = "ament_cpplint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "d5f4c5c05934b086bfdf3f7ef1ff341320db305b";
        hash = "sha256-oLEpMZ0aiRK+NyrEWzpDRKxdlQ9hA3SzAjlRaCtVV20=";
      };
    };
  });
  meta = {
    description = "The ability to check code against the Google style conventions using cpplint and generate xUnit test result files.";
  };
})
