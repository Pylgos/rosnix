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
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    actionlib_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "actionlib_msgs-source";
        owner = "ros2-gbp";
        repo = "common_interfaces-release";
        rev = "e5ca8552eb6cf8f1a9006a91eba15929fb78e5c9";
        hash = "sha256-W5qtKfERMOml/Kju3tQbLWR1kBr0jb2InsRMwMFDQwE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "actionlib_msgs";
  version = "5.3.5-1";
  src = sources.actionlib_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing some message definitions used in the implementation of ROS 1 actions.";
  };
}
