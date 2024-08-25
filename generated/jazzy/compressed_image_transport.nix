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
  substituteSource,
}:
let
  sources = rec {
    compressed_image_transport = substituteSource {
      src = fetchgit {
        name = "compressed_image_transport-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "3354b6e8ee0838d8f19708bf58b45cbe3ef71000";
        hash = "sha256-tQLLvZJxRXrPOonY4U+ppsfqALorJXB6kdZn2gC3W8Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "compressed_image_transport";
  version = "4.0.2-1";
  src = sources.compressed_image_transport;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_transport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Compressed_image_transport provides a plugin to image_transport for transparently sending images encoded as JPEG or PNG.";
  };
}
