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
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tracetools-read,
  tracetools-trace,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "tracetools_analysis";
  version = "3.1.0-2";
  src = finalAttrs.passthru.sources."tracetools_analysis";
  propagatedNativeBuildInputs = [ tracetools-read tracetools-trace ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "jupyter-notebook" "python3-pandas" ]; };
  propagatedBuildInputs = [ tracetools-read tracetools-trace ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "jupyter-notebook" "python3-pandas" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_analysis" = substituteSource {
      src = fetchgit {
        name = "tracetools_analysis-source";
        url = "https://github.com/ros2-gbp/tracetools_analysis-release.git";
        rev = "0a2a4f4dd5dfc8ab2cfc743ed65ba99939a299fa";
        hash = "sha256-R3URRL24NJ2SAhP8+NmxSVo9TjKlNvQ8bt6PsZe/H20=";
      };
    };
  });
  meta = {
    description = "Tools for analysing trace data.";
  };
})
