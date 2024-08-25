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
  python3Packages,
  ros2cli,
  substituteSource,
  tracetools_analysis,
}:
let
  sources = rec {
    ros2trace_analysis = substituteSource {
      src = fetchgit {
        name = "ros2trace_analysis-source";
        url = "https://github.com/ros2-gbp/tracetools_analysis-release.git";
        rev = "47e9583df08e815051b747d1b2237ab637727854";
        hash = "sha256-AIyVsmKHIC9W80kbsllX5PFXlmNbHmlwMSJ1Z7XeNlU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2trace_analysis";
  version = "3.1.0-1";
  src = sources.ros2trace_analysis;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2cli tracetools_analysis ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_mypy ament_pep257 ament_xmllint python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "The trace-analysis command for ROS 2 command line tools.";
  };
}
