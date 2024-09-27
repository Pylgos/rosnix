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
  ros2cli,
  rosSystemPackages,
  substituteSource,
  tracetools_analysis,
}:
let
  sources = rec {
    ros2trace_analysis-23e4677fbc691efadbad1a8a231fab60e2d794a5 = substituteSource {
      src = fetchgit {
        name = "ros2trace_analysis-23e4677fbc691efadbad1a8a231fab60e2d794a5-source";
        url = "https://github.com/ros2-gbp/tracetools_analysis-release.git";
        rev = "23e4677fbc691efadbad1a8a231fab60e2d794a5";
        hash = "sha256-88nEQ39lxqn4A5k9lH63DZqI0nV7umn2QUpbOCQyVpE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2trace_analysis";
  version = "3.0.0-6";
  src = sources.ros2trace_analysis-23e4677fbc691efadbad1a8a231fab60e2d794a5;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ros2cli tracetools_analysis ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_mypy ament_pep257 ament_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "The trace-analysis command for ROS 2 command line tools.";
  };
}
