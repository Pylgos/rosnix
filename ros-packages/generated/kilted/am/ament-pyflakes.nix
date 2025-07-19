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
  version = "0.19.2-2";
  src = finalAttrs.passthru.sources."ament_pyflakes";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "pyflakes3" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "pyflakes3" ]; };
  checkInputs = [ ament-pycodestyle ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_pyflakes" = substituteSource {
      src = fetchgit {
        name = "ament_pyflakes-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "4dabaa8b31ab78d4ccf67e4aef8db40329a73a58";
        hash = "sha256-mRqYPLlh+0gQQhGMo8BAj4VBrA2kaR3r3zBJ2X5JTM0=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check code using pyflakes and generate xUnit test\n    result files.\n  ";
  };
})
