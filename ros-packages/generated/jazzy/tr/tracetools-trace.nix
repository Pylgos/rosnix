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
  version = "8.2.3-1";
  src = finalAttrs.passthru.sources."tracetools_trace";
  propagatedNativeBuildInputs = [ lttngpy ];
  propagatedBuildInputs = [ lttngpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_trace" = substituteSource {
      src = fetchgit {
        name = "tracetools_trace-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "88f89722d627ff7a9990d4a8298317a8049fa28d";
        hash = "sha256-LyJFqmY0MJ3j71QJ0/ybO5l55hODbA/IAENiPmx/h/I=";
      };
    };
  });
  meta = {
    description = "Tools for setting up tracing sessions.";
  };
})
