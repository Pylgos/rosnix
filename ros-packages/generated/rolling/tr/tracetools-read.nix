{
  ament-copyright,
  ament-flake8,
  ament-mypy,
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
  pname = "tracetools_read";
  version = "8.4.1-1";
  src = finalAttrs.passthru.sources."tracetools_read";
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-babeltrace" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "tracetools_read" = substituteSource {
        src = fetchgit {
          name = "tracetools_read-source";
          url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
          rev = "4af8274b1e948258ebff0ac02b5b7baa5c53cd92";
          hash = "sha256-bgGmS+/Di4sXnSFjhiF+1HloAcfUBTbKOckTiOPHj+w=";
        };
      };
    });
  };
  meta = {
    description = "Tools for reading traces.";
  };
})
