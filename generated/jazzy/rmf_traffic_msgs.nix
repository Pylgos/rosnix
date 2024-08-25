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
    rmf_traffic_msgs = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "878206895e1dcdf7c0b21dd41f0953e0bebf5991";
        hash = "sha256-AFZalqcapZOxO9m3KqMakovAIUJNb5ucV403kSXzvQ0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_traffic_msgs";
  version = "3.3.1-1";
  src = sources.rmf_traffic_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing messages used by the RMF traffic management system.";
  };
}
