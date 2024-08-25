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
    actuator_msgs = substituteSource {
      src = fetchgit {
        name = "actuator_msgs-source";
        url = "https://github.com/ros2-gbp/actuator_msgs-release.git";
        rev = "5b3260652e5c325a328b021361985c4ef8b508f8";
        hash = "sha256-euXTvPVaV7xPFXP/lH9jg2S87V9DyFmp1EwJVlF7AVs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "actuator_msgs";
  version = "0.0.1-4";
  src = sources.actuator_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "ROS 2 message interface for Actuators.";
  };
}
