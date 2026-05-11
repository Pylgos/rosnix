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
  version = "0.21.0-1";
  src = finalAttrs.passthru.sources."ament_pyflakes";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "pyflakes3" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "pyflakes3" ]; };
  checkInputs = [ ament-pycodestyle ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_pyflakes" = substituteSource {
      src = fetchgit {
        name = "ament_pyflakes-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "5c82b80e8ae7e354b282775e6a15872d46c2f05e";
        hash = "sha256-mjTUgG3A0qvFJ6Mjh3nfR3H7WfOwr1ix8ty5eIExsj4=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check code using pyflakes and generate xUnit test\n    result files.\n  ";
  };
})
