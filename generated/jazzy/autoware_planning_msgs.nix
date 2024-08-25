{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
  unique_identifier_msgs,
}:
let
  sources = rec {
    autoware_planning_msgs = substituteSource {
      src = fetchgit {
        name = "autoware_planning_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "b4f96f6e29387ed979065537dea862cc25a59fab";
        hash = "sha256-BrRhj72+4kvRvHLaCv9roAUChrtG4jbulSwy8eF02VY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_planning_msgs";
  version = "1.1.0-1";
  src = sources.autoware_planning_msgs;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs nav_msgs rosidl_default_runtime std_msgs unique_identifier_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Autoware planning messages package.";
  };
}
