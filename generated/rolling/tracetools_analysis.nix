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
  tracetools_trace,
}:
let
  sources = rec {
    tracetools_analysis = substituteSource {
      src = fetchgit {
        name = "tracetools_analysis-source";
        url = "https://github.com/ros2-gbp/tracetools_analysis-release.git";
        rev = "5f652dbc5224be131ef13015b618a27d30d4878d";
        hash = "sha256-R3URRL24NJ2SAhP8+NmxSVo9TjKlNvQ8bt6PsZe/H20=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_analysis";
  version = "3.1.0-1";
  src = sources.tracetools_analysis;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ jupyter python3Packages.pandas tracetools_read tracetools_trace ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_mypy ament_pep257 ament_xmllint python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Tools for analysing trace data.";
  };
}
