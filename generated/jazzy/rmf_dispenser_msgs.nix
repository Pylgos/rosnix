{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    rmf_dispenser_msgs = substituteSource {
      src = fetchgit {
        name = "rmf_dispenser_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "61720e68e4a4c4f29a09cf7507f4816a512caf0a";
        hash = "sha256-qpAm0ecWPoXYYo1hULsTjDPidPxEL7uKxI6unEvelow=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_dispenser_msgs";
  version = "3.3.1-1";
  src = sources.rmf_dispenser_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing messages used to interface to dispenser workcells";
  };
}
