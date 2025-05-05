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
  version = "8.7.0-1";
  src = finalAttrs.passthru.sources."tracetools_launch";
  propagatedNativeBuildInputs = [ launch launch-ros tracetools-trace ];
  propagatedBuildInputs = [ launch launch-ros tracetools-trace ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_launch" = substituteSource {
      src = fetchgit {
        name = "tracetools_launch-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "1d4e1df737b4d1af140b45cbb7fb6feca28e049b";
        hash = "sha256-LGIGB/Y6+G9VSB/meTNUcWFuejXJh+ZROg4FtnOHOuU=";
      };
    };
  });
  meta = {
    description = "Launch integration for tracing.";
  };
})
