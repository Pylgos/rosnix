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
  version = "8.9.0-1";
  src = finalAttrs.passthru.sources."tracetools_trace";
  propagatedNativeBuildInputs = [ lttngpy ];
  propagatedBuildInputs = [ lttngpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_trace" = substituteSource {
      src = fetchgit {
        name = "tracetools_trace-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "55b4f2ac1267fc5be3191605980cd6eb97d8ecbc";
        hash = "sha256-6TCDIZbEaneecjtVc1lqEeuuhFYcBrsl7XREwWp3NS4=";
      };
    };
  });
  meta = {
    description = "Tools for setting up tracing sessions.";
  };
})
