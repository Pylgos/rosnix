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
        rev = "45f07814633885f5cc4ba73eadb8ff095df67ad3";
        hash = "sha256-oBojJpKki4FgnSc89Kaw6h3lzwFHyCR4E0oI6m9fg2g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_door_msgs";
  version = "3.4.0-1";
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
