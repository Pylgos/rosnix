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
    soccer_vision_2d_msgs = substituteSource {
      src = fetchgit {
        name = "soccer_vision_2d_msgs-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "c7037ba9eb39939b2e5008c671d14566ff53b9cc";
        hash = "sha256-em8g5g678f+FbD3DqO9JWOOeAsMRCYf+KT4Uo7ZFh1g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_vision_2d_msgs";
  version = "1.0.0-2";
  src = sources.soccer_vision_2d_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime soccer_vision_attribute_msgs vision_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing some 2D vision related message definitions in the soccer domain.";
  };
}
