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
  version = "0.20.2-1";
  src = finalAttrs.passthru.sources."ament_cpplint";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cpplint" = substituteSource {
      src = fetchgit {
        name = "ament_cpplint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "8809c5742cfe0469ec7535d94a1eb8e61826181a";
        hash = "sha256-YzWs+TvQTesYudbwwja2GM3i6rKtqBHNWJmgvI1IFpo=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check code against the Google style conventions using\n    cpplint and generate xUnit test result files.";
  };
})
