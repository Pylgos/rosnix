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
    rmf_building_map_msgs = substituteSource {
      src = fetchgit {
        name = "rmf_building_map_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_building_map_msgs-release.git";
        rev = "cd2a08a4ba530b41cd9f6b1ff2864ec2a02822d6";
        hash = "sha256-C77ct0ayA1iMUC5gSOnns2Wu7+0zSOFJQcUeQDWL9oE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_building_map_msgs";
  version = "1.4.1-1";
  src = sources.rmf_building_map_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Messages used to send building maps";
  };
}
