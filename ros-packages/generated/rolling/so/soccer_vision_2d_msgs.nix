{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  soccer_vision_attribute_msgs,
  substituteSource,
  vision_msgs,
}:
let
  sources = rec {
    soccer_vision_2d_msgs-feb7b4c3e931c2a99f93946e2b4ad11a8e039492 = substituteSource {
      src = fetchgit {
        name = "soccer_vision_2d_msgs-feb7b4c3e931c2a99f93946e2b4ad11a8e039492-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "feb7b4c3e931c2a99f93946e2b4ad11a8e039492";
        hash = "sha256-em8g5g678f+FbD3DqO9JWOOeAsMRCYf+KT4Uo7ZFh1g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_vision_2d_msgs";
  version = "1.0.0-1";
  src = sources.soccer_vision_2d_msgs-feb7b4c3e931c2a99f93946e2b4ad11a8e039492;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime soccer_vision_attribute_msgs vision_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing some 2D vision related message definitions in the soccer domain.";
  };
}
