{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    rmf_door_msgs = substituteSource {
      src = fetchgit {
        name = "rmf_door_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "986379366c8d3cea206c7e70ca31dc0f085a2757";
        hash = "sha256-QO2MDDtXTa8mwRTW5kPJkmHhAoJiLSl8vHWOIaKDhqM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_door_msgs";
  version = "3.3.1-1";
  src = sources.rmf_door_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Messages used to interface to doors";
  };
}
