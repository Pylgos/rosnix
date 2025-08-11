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
  version = "8.2.4-1";
  src = finalAttrs.passthru.sources."tracetools_launch";
  propagatedNativeBuildInputs = [ launch launch-ros tracetools-trace ];
  propagatedBuildInputs = [ launch launch-ros tracetools-trace ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_launch" = substituteSource {
      src = fetchgit {
        name = "tracetools_launch-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "73ef6bb9e778233f56e2eb5a2a2945a8ce3c6cd2";
        hash = "sha256-Z2Ln/Gp/sLbZ4WZ0Jpv06n8d7WIqyrdeQ//jRLPberk=";
      };
    };
  });
  meta = {
    description = "Launch integration for tracing.";
  };
})
