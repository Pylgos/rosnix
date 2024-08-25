{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
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
    can_msgs = substituteSource {
      src = fetchgit {
        name = "can_msgs-source";
        url = "https://github.com/ros2-gbp/ros_canopen-release.git";
        rev = "68c38f7cdd398daa84e83a808f8a7da772f6d71e";
        hash = "sha256-9K7mCEEppzWP9ITzFZlJje6JHNIFoBxJ/FXPs+NoX4M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "can_msgs";
  version = "2.0.0-6";
  src = sources.can_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "CAN related message types.";
  };
}
