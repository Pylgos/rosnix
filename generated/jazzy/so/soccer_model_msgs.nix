{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  soccer_geometry_msgs,
  soccer_vision_attribute_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    soccer_model_msgs-ebf0e34af5420aeb209be524c5792b13da56c101 = substituteSource {
      src = fetchgit {
        name = "soccer_model_msgs-ebf0e34af5420aeb209be524c5792b13da56c101-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "ebf0e34af5420aeb209be524c5792b13da56c101";
        hash = "sha256-CGzaSmn0XKOI2Vq0FoGUiKLfqeE3RryN6A+WRhir8+E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_model_msgs";
  version = "1.0.0-2";
  src = sources.soccer_model_msgs-ebf0e34af5420aeb209be524c5792b13da56c101;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime soccer_geometry_msgs soccer_vision_attribute_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing world model related message definitions in the soccer domain.";
  };
}
