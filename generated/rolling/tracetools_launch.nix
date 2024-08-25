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
  tracetools_trace,
}:
let
  sources = rec {
    tracetools_launch = substituteSource {
      src = fetchgit {
        name = "tracetools_launch-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "3eae245b4d1d46496c7167860a5fc1b623c3b6b1";
        hash = "sha256-VfHpTzOmTWsJi7pZHarcGk9Oabi2llch97iUgigo+Xg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_launch";
  version = "8.3.0-1";
  src = sources.tracetools_launch;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch launch_ros tracetools_trace ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_mypy ament_pep257 ament_xmllint python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Launch integration for tracing.";
  };
}
