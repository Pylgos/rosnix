{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rqt_image_overlay_layer,
  substituteSource,
  vision_msgs,
}:
let
  sources = rec {
    vision_msgs_layers-632afac377a9c77dda4ee89e2ade4692bd89ad5f = substituteSource {
      src = fetchgit {
        name = "vision_msgs_layers-632afac377a9c77dda4ee89e2ade4692bd89ad5f-source";
        url = "https://github.com/ros2-gbp/vision_msgs_layers-release.git";
        rev = "632afac377a9c77dda4ee89e2ade4692bd89ad5f";
        hash = "sha256-/AF+whPTfuXAf3vP/iP6XQf4SZFSuJjxb7oQ61JEiGs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vision_msgs_layers";
  version = "0.2.0-3";
  src = sources.vision_msgs_layers-632afac377a9c77dda4ee89e2ade4692bd89ad5f;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rqt_image_overlay_layer vision_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Collection of RQt Image Overlay Plugins for Vision Msgs";
  };
}
