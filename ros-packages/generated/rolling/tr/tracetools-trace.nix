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
  version = "8.4.1-1";
  src = finalAttrs.passthru.sources."tracetools_trace";
  propagatedBuildInputs = [ lttngpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_trace" = substituteSource {
      src = fetchgit {
        name = "tracetools_trace-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "ea837845158d89b5336ee21629f6e5b49220f35c";
        hash = "sha256-oxziwMQ7j4JxcqTyE/soRsSqbQ8t8sj3SB+19wwMeHk=";
      };
    };
  });
  meta = {
    description = "Tools for setting up tracing sessions.";
  };
})
