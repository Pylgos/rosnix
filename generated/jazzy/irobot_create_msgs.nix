{
  action_msgs,
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
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    irobot_create_msgs = substituteSource {
      src = fetchgit {
        name = "irobot_create_msgs-source";
        url = "https://github.com/ros2-gbp/irobot_create_msgs-release.git";
        rev = "d6ad51b50f113a00229ac22ef07831ed3d086002";
        hash = "sha256-N1qIlklUPDvElU+dpUZJGeSzsiBeFmgh0kyqT+KM2fs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "irobot_create_msgs";
  version = "3.0.0-2";
  src = sources.irobot_create_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Package containing action, message, and service definitions used by the iRobot(R) Create(R) platform";
  };
}
