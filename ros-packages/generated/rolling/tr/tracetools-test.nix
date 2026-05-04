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
  version = "8.10.1-2";
  src = finalAttrs.passthru.sources."tracetools_test";
  propagatedNativeBuildInputs = [ launch launch-ros tracetools-launch tracetools-read tracetools-trace ];
  propagatedBuildInputs = [ launch launch-ros tracetools-launch tracetools-read tracetools-trace ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_test" = substituteSource {
      src = fetchgit {
        name = "tracetools_test-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "750bd737e24ec03e7f99058e58e3fa8259f1a41d";
        hash = "sha256-IXaVaMKjKtaPUHDsCsf1eREEf06B6fe0KibWL2468cw=";
      };
    };
  });
  meta = {
    description = "Utilities for tracing-related tests.";
  };
})
