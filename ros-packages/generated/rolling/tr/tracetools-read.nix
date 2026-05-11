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
  version = "9.0.0-1";
  src = finalAttrs.passthru.sources."tracetools_read";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-babeltrace" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-babeltrace" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_read" = substituteSource {
      src = fetchgit {
        name = "tracetools_read-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "55fbe23013bc4c52621415b78c7968f467baebc8";
        hash = "sha256-O74nyYySBQf+38f3Tw3FGsyq0Yfwlf4MVlzOaZ8cOoc=";
      };
    };
  });
  meta = {
    description = "Tools for reading traces.";
  };
})
