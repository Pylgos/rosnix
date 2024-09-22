{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  camera_calibration_parsers,
  camera_info_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    image_common = substituteSource {
      src = fetchgit {
        name = "image_common-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "acc5e443a8ef4111b48a5adf86e358873e77eba0";
        hash = "sha256-zEuvWBkITR9VlL546Qsx9vSbwzkK+uzb4FZwz78NPtQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_common";
  version = "5.1.4-1";
  src = sources.image_common;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ camera_calibration_parsers camera_info_manager image_transport ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Common code for working with images in ROS.";
  };
}
