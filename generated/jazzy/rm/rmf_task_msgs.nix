{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rmf_dispenser_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    rmf_task_msgs-8c3afc71eb9b2ad7f5e6853cedbb0013ad110337 = substituteSource {
      src = fetchgit {
        name = "rmf_task_msgs-8c3afc71eb9b2ad7f5e6853cedbb0013ad110337-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "8c3afc71eb9b2ad7f5e6853cedbb0013ad110337";
        hash = "sha256-/hT+jeQZaC1FhffhkaFh+XaMshLsJO3TruueWB+syIU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_task_msgs";
  version = "3.3.1-1";
  src = sources.rmf_task_msgs-8c3afc71eb9b2ad7f5e6853cedbb0013ad110337;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rmf_dispenser_msgs rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing messages used to specify tasks";
  };
}
