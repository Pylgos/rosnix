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
  version = "8.2.2-1";
  src = finalAttrs.passthru.sources."tracetools_test";
  propagatedBuildInputs = [ launch launch-ros tracetools-launch tracetools-read tracetools-trace ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_test" = substituteSource {
      src = fetchgit {
        name = "tracetools_test-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "6fb2389546fe86bfaa694e6afcbce145daf4d077";
        hash = "sha256-qf0i8ZHVhXe0qGM4G7TZ8hqrou6iKvFN/AMFYG12ux8=";
      };
    };
  });
  meta = {
    description = "Utilities for tracing-related tests.";
  };
})
