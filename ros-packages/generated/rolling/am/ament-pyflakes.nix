{
  ament-pycodestyle,
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
  pname = "ament_pyflakes";
  version = "0.20.0-1";
  src = finalAttrs.passthru.sources."ament_pyflakes";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "pyflakes3" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "pyflakes3" ]; };
  checkInputs = [ ament-pycodestyle ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_pyflakes" = substituteSource {
      src = fetchgit {
        name = "ament_pyflakes-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "78d8fbe8446bd0ffd5d7a83bbd96f9efa64aaec7";
        hash = "sha256-FT5Rq8f1QY8xXRvmclj1l1cNnY+NNJTTTTgLLUMpjC4=";
      };
    };
  });
  meta = {
    description = "The ability to check code using pyflakes and generate xUnit test result files.";
  };
})
