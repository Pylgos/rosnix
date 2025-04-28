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
  version = "8.7.0-1";
  src = finalAttrs.passthru.sources."tracetools_trace";
  propagatedBuildInputs = [ lttngpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_trace" = substituteSource {
      src = fetchgit {
        name = "tracetools_trace-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "c3274d5f2503bb9d9af9c1b7d25f8ea8a7e88fe9";
        hash = "sha256-Wp1p0u+mdZH9ir1BibRlIeBdu6ZvTfYlPD+klRB1w3E=";
      };
    };
  });
  meta = {
    description = "Tools for setting up tracing sessions.";
  };
})
