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
  version = "8.4.1-1";
  src = finalAttrs.passthru.sources."tracetools_test";
  propagatedBuildInputs = [ launch launch-ros tracetools-launch tracetools-read tracetools-trace ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "tracetools_test" = substituteSource {
        src = fetchgit {
          name = "tracetools_test-source";
          url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
          rev = "a420df55baa63e8631cc82144de59c612626938f";
          hash = "sha256-1J3CiaY+1IvsQ++jBCVMwaHHNya0+93GZu3DeafC4vs=";
        };
      };
    });
  };
  meta = {
    description = "Utilities for tracing-related tests.";
  };
})
