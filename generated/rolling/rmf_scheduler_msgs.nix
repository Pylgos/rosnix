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
    rmf_scheduler_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "rmf_scheduler_msgs-source";
        owner = "ros2-gbp";
        repo = "rmf_internal_msgs-release";
        rev = "896e6d2c056e44abe8b6110123ce52c26173fbfb";
        hash = "sha256-sQnWMNgyUZN/3Mc5PkyywUFcKwMTrtlUj8MYSDmzz3M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_scheduler_msgs";
  version = "3.4.0-1";
  src = sources.rmf_scheduler_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Messages used by rmf_scheduler_msgs";
  };
}
