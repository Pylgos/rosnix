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
  substituteSource,
}:
let
  sources = rec {
    soccer_vision_attribute_msgs-1164baa13d700d661b20449aa501c79732297c49 = substituteSource {
      src = fetchgit {
        name = "soccer_vision_attribute_msgs-1164baa13d700d661b20449aa501c79732297c49-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "1164baa13d700d661b20449aa501c79732297c49";
        hash = "sha256-9qP2U6SUU5zrVvt+xkbzRF6iJCxm6YSfeUBgsj29Hf8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_vision_attribute_msgs";
  version = "1.0.0-1";
  src = sources.soccer_vision_attribute_msgs-1164baa13d700d661b20449aa501c79732297c49;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing attributes of objects in 2d/3d vision in the soccer domain.";
  };
}
