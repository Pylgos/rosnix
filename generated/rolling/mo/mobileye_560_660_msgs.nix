{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    mobileye_560_660_msgs-59798e15c2258f70dd4c21841b821673ad6a47b2 = substituteSource {
      src = fetchgit {
        name = "mobileye_560_660_msgs-59798e15c2258f70dd4c21841b821673ad6a47b2-source";
        url = "https://github.com/ros2-gbp/astuff_sensor_msgs-release.git";
        rev = "59798e15c2258f70dd4c21841b821673ad6a47b2";
        hash = "sha256-VUBlCZa6YHrHj0N2L4MPJZXOD74+Uu4leG3oXg1ZOJg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mobileye_560_660_msgs";
  version = "4.0.0-3";
  src = sources.mobileye_560_660_msgs-59798e15c2258f70dd4c21841b821673ad6a47b2;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Message definitions for the Mobileye 560/660";
  };
}
