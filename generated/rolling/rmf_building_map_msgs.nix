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
        rev = "e409acc4f2091d16a17a0a012be4ad2c5186e5e5";
        hash = "sha256-panz5UM+k9FD/nfgBmSl6D13IlI/AjxpDJlGjI0IaZs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_building_map_msgs";
  version = "1.5.0-1";
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
