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
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."ament_cpplint";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cpplint" = substituteSource {
      src = fetchgit {
        name = "ament_cpplint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "f84363821d63e38e46e04535a01948433a3d40e7";
        hash = "sha256-Q6Ay5woQK7KUhjUOoSq2uY9vVM5KJJuK7X8njaioKns=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check code against the Google style conventions using\n    cpplint and generate xUnit test result files.";
  };
})
