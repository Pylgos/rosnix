{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
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
    rosgraph_msgs-9af86c0d06f950a298f48c4380eb93646a25bd91 = substituteSource {
      src = fetchgit {
        name = "rosgraph_msgs-9af86c0d06f950a298f48c4380eb93646a25bd91-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "9af86c0d06f950a298f48c4380eb93646a25bd91";
        hash = "sha256-hEDZCurb6TJooZeBv+lAeDryX6S2nIjCRJkpeItDr0o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosgraph_msgs";
  version = "2.0.2-2";
  src = sources.rosgraph_msgs-9af86c0d06f950a298f48c4380eb93646a25bd91;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Messages relating to the ROS Computation Graph. These are generally considered to be low-level messages that end users do not interact with.";
  };
}
