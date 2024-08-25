{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    controller_manager_msgs = substituteSource {
      src = fetchgit {
        name = "controller_manager_msgs-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "0b31846e8160d23d66440eacce810d0dd4dc8eae";
        hash = "sha256-hpHCpPWSuGQIZKRwSKpEDwAjWDA2hmFExV75H6qZmps=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "controller_manager_msgs";
  version = "4.16.0-1";
  src = sources.controller_manager_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces lifecycle_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Messages and services for the controller manager.";
  };
}
