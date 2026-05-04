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
  version = "8.10.1-2";
  src = finalAttrs.passthru.sources."tracetools_trace";
  propagatedNativeBuildInputs = [ lttngpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "procps" ]; };
  propagatedBuildInputs = [ lttngpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "procps" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_trace" = substituteSource {
      src = fetchgit {
        name = "tracetools_trace-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "9806ce0f89c0c60ca99c0bce99b112d5cf7ff5b9";
        hash = "sha256-NfIhgLD5R76OI6iNFTXhbQuNyPYrOIkd5SvscwcnDWw=";
      };
    };
  });
  meta = {
    description = "Tools for setting up tracing sessions.";
  };
})
