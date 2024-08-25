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
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    visualization_msgs = substituteSource {
      src = fetchgit {
        name = "visualization_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "129eac1285a1f1df2afb99ef6e130968fa7f287c";
        hash = "sha256-9hi9fbYKjuHxGMO+Oiykg7g21bDIVNc5sK/cmoS3SEg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "visualization_msgs";
  version = "5.3.5-1";
  src = sources.visualization_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing some visualization and interaction related message definitions.";
  };
}
