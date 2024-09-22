{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchFromGitHub,
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
    rosgraph_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "rosgraph_msgs-source";
        owner = "ros2-gbp";
        repo = "rcl_interfaces-release";
        rev = "07495169163189e3895cb3e652fc27571c484904";
        hash = "sha256-B3gVufOIYmlRTjNaV1pnpr+otD65X0o4eZtZyHj4Ulg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosgraph_msgs";
  version = "2.2.0-1";
  src = sources.rosgraph_msgs;
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
