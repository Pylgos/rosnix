{
  ament_copyright,
  ament_flake8,
  ament_mypy,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
  tracetools_read,
}:
let
  sources = rec {
    tracetools_analysis = substituteSource {
      src = fetchgit {
        name = "tracetools_analysis-source";
        url = "https://github.com/ros2-gbp/tracetools_analysis-release.git";
        rev = "64fed20f71cccc3ad9670dd36ce9066b14545df4";
        hash = "sha256-DPKjLLYf07C3NN4cCJqYVc28MZaOWmDTrLO+g2oyGwA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_analysis";
  version = "3.0.0-6";
  src = sources.tracetools_analysis;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ tracetools_read ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "jupyter-notebook" "python3-pandas" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_mypy ament_pep257 ament_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Tools for analysing trace data.";
  };
}
