{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  camera_calibration,
  depth_image_proc,
  fetchgit,
  fetchurl,
  fetchzip,
  image_proc,
  image_publisher,
  image_rotate,
  image_view,
  stereo_image_proc,
  substituteSource,
}:
let
  sources = rec {
    image_pipeline = substituteSource {
      src = fetchgit {
        name = "image_pipeline-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "fed0f986ecf229e5961d95e9be8148741c660fd6";
        hash = "sha256-q7y9egqF5xBObw7jvwqGh35FMQpjwTZtKSwROubyats=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_pipeline";
  version = "6.0.3-1";
  src = sources.image_pipeline;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_calibration depth_image_proc image_proc image_publisher image_rotate image_view stereo_image_proc ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_lint_cmake ament_cmake_xmllint ament_lint_auto ];
  missingDependencies = [  ];
  meta = {
    description = "image_pipeline fills the gap between getting raw images from a camera driver and higher-level vision processing.";
  };
}
