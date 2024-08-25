{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rmf_dispenser_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    rmf_ingestor_msgs = substituteSource {
      src = fetchgit {
        name = "rmf_ingestor_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "703b764f5209079372337e9ef30e6608fc69df4c";
        hash = "sha256-mV4zRGv4p2Z14D4ZBO3j4ZdV8iq0fEshoEGIXtohlK0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_ingestor_msgs";
  version = "3.3.1-1";
  src = sources.rmf_ingestor_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rmf_dispenser_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing messages used to interface to ingestor workcells";
  };
}
