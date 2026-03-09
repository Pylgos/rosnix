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
  version = "8.10.0-1";
  src = finalAttrs.passthru.sources."tracetools_test";
  propagatedNativeBuildInputs = [ launch launch-ros tracetools-launch tracetools-read tracetools-trace ];
  propagatedBuildInputs = [ launch launch-ros tracetools-launch tracetools-read tracetools-trace ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_test" = substituteSource {
      src = fetchgit {
        name = "tracetools_test-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "cbf6e059a05a8540d713e2286b3fb6d9b216ee01";
        hash = "sha256-MEhg7nn+hMNs/B2NA/p9sULv71XdRHaGNSB8vi7zkKM=";
      };
    };
  });
  meta = {
    description = "Utilities for tracing-related tests.";
  };
})
