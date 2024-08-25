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
    turtlesim_msgs = substituteSource {
      src = fetchgit {
        name = "turtlesim_msgs-source";
        url = "https://github.com/ros2-gbp/ros_tutorials-release.git";
        rev = "32803185ffaa1712359144f154fa283c7ee22ee9";
        hash = "sha256-9dFwJZsBR6QXBfY2HhiX0w5K8eOkSgPLyZpmykHcDe0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlesim_msgs";
  version = "1.9.2-1";
  src = sources.turtlesim_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "turtlesim messages.";
  };
}
