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
  version = "8.2.2-1";
  src = finalAttrs.passthru.sources."tracetools_trace";
  propagatedBuildInputs = [ lttngpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_trace" = substituteSource {
      src = fetchgit {
        name = "tracetools_trace-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "89c3d3d5186f550d827edaadfc2be33eb0a04d07";
        hash = "sha256-gj1/GpN/5f+6kwdGvmKGBqmzIBHSME+hUPhI8VLqn3c=";
      };
    };
  });
  meta = {
    description = "Tools for setting up tracing sessions.";
  };
})
