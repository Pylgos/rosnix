{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchFromGitHub,
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
    kartech_linear_actuator_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "kartech_linear_actuator_msgs-source";
        owner = "ros2-gbp";
        repo = "astuff_sensor_msgs-release";
        rev = "ff9619e827b54c47fa7510043858db7b8a01d211";
        hash = "sha256-Xad77u1Iv7LJdsdK8vW1H475ls/kjnSvZbln4wUXpmQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kartech_linear_actuator_msgs";
  version = "4.0.0-4";
  src = sources.kartech_linear_actuator_msgs;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The kartech_linear_actuator_msgs package";
  };
}
