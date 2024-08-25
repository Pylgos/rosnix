{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_core_generators,
  rosidl_core_runtime,
  service_msgs,
  substituteSource,
  unique_identifier_msgs,
}:
let
  sources = rec {
    action_msgs = substituteSource {
      src = fetchgit {
        name = "action_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "6e0b31e86079a661e1aa4a13cab22c4c5c6a0c73";
        hash = "sha256-0XYc90JzsBo5Kqbj1YJl3q/1gyUYZI1G/kewVb/PPWs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "action_msgs";
  version = "2.0.2-2";
  src = sources.action_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_core_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_core_runtime service_msgs unique_identifier_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Messages and service definitions common among all ROS actions.";
  };
}
