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
  launch,
  launch_ros,
  python3Packages,
  substituteSource,
  tracetools_launch,
  tracetools_read,
  tracetools_trace,
}:
let
  sources = rec {
    tracetools_test = substituteSource {
      src = fetchgit {
        name = "tracetools_test-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "7c218f661d8fdf1bb99003c64d3935a0083b6baf";
        hash = "sha256-RR+g7apKjiBL9Ww77YrDHd915WVymIZiQ2pMoV261rA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_test";
  version = "8.2.1-1";
  src = sources.tracetools_test;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch launch_ros tracetools_launch tracetools_read tracetools_trace ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_mypy ament_pep257 ament_xmllint python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Utilities for tracing-related tests.";
  };
}
