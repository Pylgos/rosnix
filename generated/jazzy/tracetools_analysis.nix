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
  jupyter,
  python3Packages,
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
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ jupyter python3Packages.pandas tracetools_read ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_mypy ament_pep257 ament_xmllint python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Tools for analysing trace data.";
  };
}
