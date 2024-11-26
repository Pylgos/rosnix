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
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "tracetools_analysis";
  version = "3.0.0-6";
  src = finalAttrs.passthru.sources."tracetools_analysis";
  propagatedBuildInputs = [ tracetools-read ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "jupyter-notebook" "python3-pandas" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "tracetools_analysis" = substituteSource {
        src = fetchgit {
          name = "tracetools_analysis-source";
          url = "https://github.com/ros2-gbp/tracetools_analysis-release.git";
          rev = "64fed20f71cccc3ad9670dd36ce9066b14545df4";
          hash = "sha256-DPKjLLYf07C3NN4cCJqYVc28MZaOWmDTrLO+g2oyGwA=";
        };
      };
    });
  };
  meta = {
    description = "Tools for analysing trace data.";
  };
})
