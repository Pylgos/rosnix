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
  launch,
  launch-ros,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tracetools-launch,
  tracetools-read,
  tracetools-trace,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "tracetools_test";
  version = "8.6.0-1";
  src = finalAttrs.passthru.sources."tracetools_test";
  propagatedBuildInputs = [ launch launch-ros tracetools-launch tracetools-read tracetools-trace ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_test" = substituteSource {
      src = fetchgit {
        name = "tracetools_test-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "2a3fbd849dfc4bbd85ebd5e30e3afee421ad6bb3";
        hash = "sha256-WF6GfQieF65UJDHf1A9W26iBxNiqiEnXokFKyWPloTA=";
      };
    };
  });
  meta = {
    description = "Utilities for tracing-related tests.";
  };
})
