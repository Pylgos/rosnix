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
  version = "8.2.5-1";
  src = finalAttrs.passthru.sources."tracetools_test";
  propagatedNativeBuildInputs = [ launch launch-ros tracetools-launch tracetools-read tracetools-trace ];
  propagatedBuildInputs = [ launch launch-ros tracetools-launch tracetools-read tracetools-trace ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_test" = substituteSource {
      src = fetchgit {
        name = "tracetools_test-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "0a14046705de9fc65daa282c7d0a76a1a21b4bff";
        hash = "sha256-MrZxF4rKyZNSEPHLw2GZsYfB/fFPbcYUSO8OjhkIdno=";
      };
    };
  });
  meta = {
    description = "Utilities for tracing-related tests.";
  };
})
