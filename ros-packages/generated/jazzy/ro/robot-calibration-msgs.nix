{
  action-msgs,
  ament-cmake,
  buildRosPackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "robot_calibration_msgs" = substituteSource {
      src = fetchgit {
        name = "robot_calibration_msgs-source";
        url = "https://github.com/ros2-gbp/robot_calibration-release.git";
        rev = "da10d327d163f876515120c334eb713c85db36ab";
        hash = "sha256-lfMQdnRxs+kDcLuWt6FnTUk46tW/cXzx6CeB/GYZ8T8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "robot_calibration_msgs";
  version = "0.9.1-1";
  src = sources."robot_calibration_msgs";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Messages for calibrating a robot";
  };
}
