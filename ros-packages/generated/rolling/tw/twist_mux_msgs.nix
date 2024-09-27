{
  action_msgs,
  ament_cmake,
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
    twist_mux_msgs-24a68a09c840a3181fcd53dc7234f74c736733b9 = substituteSource {
      src = fetchgit {
        name = "twist_mux_msgs-24a68a09c840a3181fcd53dc7234f74c736733b9-source";
        url = "https://github.com/ros2-gbp/twist_mux_msgs-release.git";
        rev = "24a68a09c840a3181fcd53dc7234f74c736733b9";
        hash = "sha256-ILOj3MizVk8mZox4k3XDTrx1z7e20vK78J+4k6OuLx8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "twist_mux_msgs";
  version = "3.0.1-2";
  src = sources.twist_mux_msgs-24a68a09c840a3181fcd53dc7234f74c736733b9;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action_msgs rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The twist_mux msgs and actions package";
  };
}
