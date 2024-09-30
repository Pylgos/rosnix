{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  soccer-vision-attribute-msgs,
  substituteSource,
  vision-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "soccer_vision_2d_msgs" = substituteSource {
      src = fetchgit {
        name = "soccer_vision_2d_msgs-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "feb7b4c3e931c2a99f93946e2b4ad11a8e039492";
        hash = "sha256-em8g5g678f+FbD3DqO9JWOOeAsMRCYf+KT4Uo7ZFh1g=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "soccer-vision-2d-msgs";
  version = "1.0.0-1";
  src = sources."soccer_vision_2d_msgs";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl-default-runtime soccer-vision-attribute-msgs vision-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing some 2D vision related message definitions in the soccer domain.";
  };
}