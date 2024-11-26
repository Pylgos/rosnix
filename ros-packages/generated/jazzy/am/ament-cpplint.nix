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
  version = "0.17.1-1";
  src = finalAttrs.passthru.sources."ament_cpplint";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cpplint" = substituteSource {
        src = fetchgit {
          name = "ament_cpplint-source";
          url = "https://github.com/ros2-gbp/ament_lint-release.git";
          rev = "11877123f5f285c0dbdd8a5aa4ae6bea6d238cf6";
          hash = "sha256-13KjfdbDXUhNFxtNJI4LCKRBjlVB1sw/ZlnAOK4FJ9c=";
        };
      };
    });
  };
  meta = {
    description = "The ability to check code against the Google style conventions using cpplint and generate xUnit test result files.";
  };
})
