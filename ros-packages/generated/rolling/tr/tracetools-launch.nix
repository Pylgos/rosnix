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
  tracetools-trace,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "tracetools_launch";
  version = "8.9.0-1";
  src = finalAttrs.passthru.sources."tracetools_launch";
  propagatedNativeBuildInputs = [ launch launch-ros tracetools-trace ];
  propagatedBuildInputs = [ launch launch-ros tracetools-trace ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_launch" = substituteSource {
      src = fetchgit {
        name = "tracetools_launch-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "a73d53f6fac91472b8595c16ee2b9be868fada19";
        hash = "sha256-dPI8wmCwOBhP8x1lbY0K9V9TC2gETFN6OCp6US3Ssxw=";
      };
    };
  });
  meta = {
    description = "Launch integration for tracing.";
  };
})
