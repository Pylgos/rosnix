{
  action_msgs,
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    robot_calibration_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "robot_calibration_msgs-source";
        owner = "ros2-gbp";
        repo = "robot_calibration-release";
        rev = "c9e344f1f28e39d7715b4deeae5fa288155cc8d0";
        hash = "sha256-b3n32e2IjIsvjVq2nY/zf7dUbihjtmww0IfyUiyHFVU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "robot_calibration_msgs";
  version = "0.9.0-1";
  src = sources.robot_calibration_msgs;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action_msgs builtin_interfaces rosidl_default_runtime sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Messages for calibrating a robot";
  };
}
