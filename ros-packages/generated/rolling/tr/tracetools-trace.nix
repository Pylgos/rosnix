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
  version = "8.5.0-1";
  src = finalAttrs.passthru.sources."tracetools_trace";
  propagatedBuildInputs = [ lttngpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_trace" = substituteSource {
      src = fetchgit {
        name = "tracetools_trace-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "142cc6a36b3d965d5c9ee7c20387ea21a796b14b";
        hash = "sha256-pzhij26e17gx640pewkDm0+05R3GZz53bS8n/I9hPxA=";
      };
    };
  });
  meta = {
    description = "Tools for setting up tracing sessions.";
  };
})
