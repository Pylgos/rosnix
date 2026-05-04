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
  version = "8.10.1-2";
  src = finalAttrs.passthru.sources."tracetools_launch";
  propagatedNativeBuildInputs = [ launch launch-ros tracetools-trace ];
  propagatedBuildInputs = [ launch launch-ros tracetools-trace ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_launch" = substituteSource {
      src = fetchgit {
        name = "tracetools_launch-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "6e41aed415bbf45e3adba7f200b34369d6d6cf61";
        hash = "sha256-SHMG3WvvzTFqlOmg7+SUyHS7H+re1RyCvKGaMgn9CvE=";
      };
    };
  });
  meta = {
    description = "Launch integration for tracing.";
  };
})
