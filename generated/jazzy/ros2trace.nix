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
  tracetools_trace,
}:
let
  sources = rec {
    ros2trace = substituteSource {
      src = fetchgit {
        name = "ros2trace-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "5223ad9d5972e59c64ea5936c068533628510dcb";
        hash = "sha256-hmiZoe7r+QFGR4VLuq03ec/KXmfgWmZvQ4nKaCHAx0w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2trace";
  version = "8.2.1-1";
  src = sources.ros2trace;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2cli tracetools_trace ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_mypy ament_pep257 ament_xmllint python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "The trace command for ROS 2 command line tools.";
  };
}
