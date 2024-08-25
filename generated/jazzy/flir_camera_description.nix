{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  robot_state_publisher,
  substituteSource,
  urdf,
  xacro,
}:
let
  sources = rec {
    flir_camera_description = substituteSource {
      src = fetchgit {
        name = "flir_camera_description-source";
        url = "https://github.com/ros2-gbp/flir_camera_driver-release.git";
        rev = "8f67b40ac16a50c4a57a54b1839ca12b61bff0bf";
        hash = "sha256-BW9xfT7JS4SQrUug5BG2EQ0c49xUa1glCNWO0Wpwk2g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flir_camera_description";
  version = "2.0.20-1";
  src = sources.flir_camera_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ robot_state_publisher urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "FLIR camera Description package";
  };
}
