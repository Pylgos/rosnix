{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "soccer_vision_attribute_msgs" = substituteSource {
      src = fetchgit {
        name = "soccer_vision_attribute_msgs-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "f44eead2de262caf02988809719f54cf89f5d8d7";
        hash = "sha256-9qP2U6SUU5zrVvt+xkbzRF6iJCxm6YSfeUBgsj29Hf8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "soccer_vision_attribute_msgs";
  version = "1.0.0-2";
  src = sources."soccer_vision_attribute_msgs";
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
