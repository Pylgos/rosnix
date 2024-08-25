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
        rev = "7ebe7c6a5fc83d4247c47f5ee6889d1512725f53";
        hash = "sha256-S06JJzvBbISxt23CmHnbQIa8OxvO4unfdztMhznw8Zo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_launch";
  version = "8.2.1-1";
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
