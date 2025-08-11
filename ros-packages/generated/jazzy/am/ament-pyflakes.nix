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
  version = "0.17.3-1";
  src = finalAttrs.passthru.sources."ament_pyflakes";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "pyflakes3" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "pyflakes3" ]; };
  checkInputs = [ ament-pycodestyle ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_pyflakes" = substituteSource {
      src = fetchgit {
        name = "ament_pyflakes-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "7be546d9a631ca2ba4f5b9c8b4ec9325039b4cc5";
        hash = "sha256-5iIY3d1utls8ZYGyVElDG5NejQWiIehPEaE2N5pmmsc=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check code using pyflakes and generate xUnit test\n    result files.\n  ";
  };
})
