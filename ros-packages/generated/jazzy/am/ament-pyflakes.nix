{
  ament-pycodestyle,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_pyflakes";
  version = "0.17.1-1";
  src = finalAttrs.passthru.sources."ament_pyflakes";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "pyflakes3" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "pyflakes3" ]; };
  checkInputs = [ ament-pycodestyle ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_pyflakes" = substituteSource {
      src = fetchgit {
        name = "ament_pyflakes-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "1862376009b02b5088acb8ac300da55e65394d8a";
        hash = "sha256-KMHU5aqi9tt95GgtqbB7obYtSAUxzWzR/UFQhILKkdk=";
      };
    };
  });
  meta = {
    description = "The ability to check code using pyflakes and generate xUnit test result files.";
  };
})
