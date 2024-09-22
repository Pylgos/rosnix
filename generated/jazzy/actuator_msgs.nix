{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    actuator_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "actuator_msgs-source";
        owner = "ros2-gbp";
        repo = "actuator_msgs-release";
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
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS 2 message interface for Actuators.";
  };
}
