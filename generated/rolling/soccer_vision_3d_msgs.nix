{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  soccer_vision_attribute_msgs,
  substituteSource,
  vision_msgs,
}:
let
  sources = rec {
    soccer_vision_3d_msgs = substituteSource {
      src = fetchgit {
        name = "soccer_vision_3d_msgs-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "72599c545ef722b418ffd81f89a3f171b17454c4";
        hash = "sha256-mefLwquylSQ8WewNihJ2SMPAIUXP2T1Ye+Q7n9q7b8c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_vision_3d_msgs";
  version = "1.0.0-1";
  src = sources.soccer_vision_3d_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime soccer_vision_attribute_msgs vision_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing some 3D vision related message definitions in the soccer domain.";
  };
}
