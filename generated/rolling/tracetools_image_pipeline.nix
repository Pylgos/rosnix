{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pkg-config,
  substituteSource,
}:
let
  sources = rec {
    tracetools_image_pipeline = substituteSource {
      src = fetchgit {
        name = "tracetools_image_pipeline-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "eae6b9c3cefb2a7ba38754bb54e420f04a10208f";
        hash = "sha256-9UnLZuObDSfdlFlp7mE3Lk/BgnZRMXtI9gY9IngO18c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_image_pipeline";
  version = "6.0.3-1";
  src = sources.tracetools_image_pipeline;
  nativeBuildInputs = [ ament_cmake_ros pkg-config ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "LTTng tracing provider wrapper for image_pipeline ROS 2 meta-package.";
  };
}
