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
  tracetools_trace,
}:
let
  sources = rec {
    tracetools_analysis-5f652dbc5224be131ef13015b618a27d30d4878d = substituteSource {
      src = fetchgit {
        name = "tracetools_analysis-5f652dbc5224be131ef13015b618a27d30d4878d-source";
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
  src = sources.tracetools_analysis-5f652dbc5224be131ef13015b618a27d30d4878d;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ tracetools_read tracetools_trace ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "jupyter-notebook" "python3-pandas" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_mypy ament_pep257 ament_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Tools for analysing trace data.";
  };
}
