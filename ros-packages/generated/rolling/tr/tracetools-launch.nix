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
  version = "8.8.1-1";
  src = finalAttrs.passthru.sources."tracetools_launch";
  propagatedNativeBuildInputs = [ launch launch-ros tracetools-trace ];
  propagatedBuildInputs = [ launch launch-ros tracetools-trace ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_launch" = substituteSource {
      src = fetchgit {
        name = "tracetools_launch-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "bbdfc169bfed2e85ba2af6e092ed09a4745f3f92";
        hash = "sha256-OsNRtDexRScsFRn8ZA5Tv+ncaVCkShCeC4Lz2wKL3bM=";
      };
    };
  });
  meta = {
    description = "Launch integration for tracing.";
  };
})
