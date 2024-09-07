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
        rev = "07fbf87983b1e02cc5f138768cd4a6d2456a6c5b";
        hash = "sha256-WhG58D33BNx94W7XCDeiImOsq/vkVF9rYMMjA+xTm1M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2trace";
  version = "8.2.2-1";
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
