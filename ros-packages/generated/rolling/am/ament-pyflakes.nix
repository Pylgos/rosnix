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
  version = "0.19.0-1";
  src = finalAttrs.passthru.sources."ament_pyflakes";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "pyflakes3" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "pyflakes3" ]; };
  checkInputs = [ ament-pycodestyle ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_pyflakes" = substituteSource {
        src = fetchgit {
          name = "ament_pyflakes-source";
          url = "https://github.com/ros2-gbp/ament_lint-release.git";
          rev = "df79dece47cc895062ba32c1c9fbbac766c8df31";
          hash = "sha256-4m1vwjGFjvQKrYLks9gZMvNNAk3YGARvjcaUBCwWMPs=";
        };
      };
    });
  };
  meta = {
    description = "The ability to check code using pyflakes and generate xUnit test result files.";
  };
})
