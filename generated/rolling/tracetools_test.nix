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
        rev = "ac9cbb89f0f0bce59334eab5711d39a9d5d8582c";
        hash = "sha256-iuL5uGEHc2o9/bDeVLOxx8EOmQNVH7Gc/PbSNpKJ81E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_test";
  version = "8.3.0-1";
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
