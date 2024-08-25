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
        rev = "3fb7c70cbffb0f133cc2983d97c44a327868b1d7";
        hash = "sha256-syEe+LBPAb854To6mEMEVf6Kbp35tfuyhK2z7uKL0hc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_image_pipeline";
  version = "5.0.4-1";
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
