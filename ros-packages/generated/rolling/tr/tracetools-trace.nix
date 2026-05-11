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
  version = "9.0.0-1";
  src = finalAttrs.passthru.sources."tracetools_trace";
  propagatedNativeBuildInputs = [ lttngpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "procps" ]; };
  propagatedBuildInputs = [ lttngpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "procps" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_trace" = substituteSource {
      src = fetchgit {
        name = "tracetools_trace-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "2f508f1504a2d426fa1602858d7643177e145c37";
        hash = "sha256-vwOJ6oYS3FtrVbHhYOO4eiRhEGSCEkv3dXFhGZ0UL3Y=";
      };
    };
  });
  meta = {
    description = "Tools for setting up tracing sessions.";
  };
})
