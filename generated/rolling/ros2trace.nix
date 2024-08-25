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
        rev = "98e66952de165ccf24aa0af3a1f4de7c1b032747";
        hash = "sha256-R+Nm704+TiBp9ZBjT9M1zfnM50hSgFey7UCI266LzAs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2trace";
  version = "8.3.0-1";
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
