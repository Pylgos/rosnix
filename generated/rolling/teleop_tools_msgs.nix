{
  action_msgs,
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    teleop_tools_msgs = substituteSource {
      src = fetchgit {
        name = "teleop_tools_msgs-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "d85c7f1fded3c91df9274b2f5cc794e2bc3abe13";
        hash = "sha256-ZP73iRktZ99bhO727JQZry6o10V/7WbbL8u14VQJ9+w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "teleop_tools_msgs";
  version = "1.5.1-1";
  src = sources.teleop_tools_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "The teleop_tools_msgs package";
  };
}
