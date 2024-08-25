{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  libjpeg_turbo,
  substituteSource,
}:
let
  sources = rec {
    turbojpeg_compressed_image_transport = substituteSource {
      src = fetchgit {
        name = "turbojpeg_compressed_image_transport-source";
        url = "https://github.com/ros2-gbp/turbojpeg_compressed_image_transport-release.git";
        rev = "7a7cfccd327c480d90d212802c88a4da983ddfcd";
        hash = "sha256-290O2WlZeS1IA0hOWZ0GYuYv0yt8SkAIxoz+P3YiVi8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turbojpeg_compressed_image_transport";
  version = "0.2.1-4";
  src = sources.turbojpeg_compressed_image_transport;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_transport libjpeg_turbo ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Compressed_image_transport provides a plugin to image_transport for transparently sending images encoded as JPEG by turbojpeg.";
  };
}
