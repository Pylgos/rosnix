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
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    actionlib_msgs = substituteSource {
      src = fetchgit {
        name = "actionlib_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "f5035948dce2ee364ae95ec431dcd3523e4b2b56";
        hash = "sha256-dQGRJRukTE6CLpk3gynFaqd4seZ2l8LMthey+WsWCvs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "actionlib_msgs";
  version = "5.4.1-1";
  src = sources.actionlib_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing some message definitions used in the implementation of ROS 1 actions.";
  };
}
