{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  camera-calibration-parsers,
  camera-info-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "image_common" = substituteSource {
      src = fetchgit {
        name = "image_common-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "acc5e443a8ef4111b48a5adf86e358873e77eba0";
        hash = "sha256-zEuvWBkITR9VlL546Qsx9vSbwzkK+uzb4FZwz78NPtQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "image-common";
  version = "5.1.4-1";
  src = sources."image_common";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ camera-calibration-parsers camera-info-manager image-transport ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Common code for working with images in ROS.";
  };
}