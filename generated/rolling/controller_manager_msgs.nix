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
        rev = "a1674307a88c5326bd00e764d69e6232581763e0";
        hash = "sha256-LwVz/TYa/E4CpF9+xL42QXPSF2NfDyx6zpBZzStqKl4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "controller_manager_msgs";
  version = "4.16.1-1";
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
