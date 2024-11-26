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
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."tracetools_analysis";
  propagatedBuildInputs = [ tracetools-read tracetools-trace ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "jupyter-notebook" "python3-pandas" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_analysis" = substituteSource {
      src = fetchgit {
        name = "tracetools_analysis-source";
        url = "https://github.com/ros2-gbp/tracetools_analysis-release.git";
        rev = "5f652dbc5224be131ef13015b618a27d30d4878d";
        hash = "sha256-R3URRL24NJ2SAhP8+NmxSVo9TjKlNvQ8bt6PsZe/H20=";
      };
    };
  });
  meta = {
    description = "Tools for analysing trace data.";
  };
})
