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
  lttngpy,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "tracetools_trace";
  version = "8.2.5-1";
  src = finalAttrs.passthru.sources."tracetools_trace";
  propagatedNativeBuildInputs = [ lttngpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "procps" ]; };
  propagatedBuildInputs = [ lttngpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "procps" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_trace" = substituteSource {
      src = fetchgit {
        name = "tracetools_trace-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "8797bc56c0c0e4065d652503616a09b99058886a";
        hash = "sha256-qoy1zsfm5g+RnoUSxiF12o+FzdGQ2VFGyZexAWrbPxk=";
      };
    };
  });
  meta = {
    description = "Tools for setting up tracing sessions.";
  };
})
