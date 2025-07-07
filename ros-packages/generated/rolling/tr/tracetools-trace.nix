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
  version = "8.8.0-1";
  src = finalAttrs.passthru.sources."tracetools_trace";
  propagatedNativeBuildInputs = [ lttngpy ];
  propagatedBuildInputs = [ lttngpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_trace" = substituteSource {
      src = fetchgit {
        name = "tracetools_trace-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "165407b28bbc4e82f15f4511a2a36964f7028a3e";
        hash = "sha256-OK3HQNE4/L+Hm2MMnOjRnTKp5NTBg7jzdQWAbkyHQH8=";
      };
    };
  });
  meta = {
    description = "Tools for setting up tracing sessions.";
  };
})
