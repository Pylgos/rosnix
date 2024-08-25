{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    kartech_linear_actuator_msgs = substituteSource {
      src = fetchgit {
        name = "kartech_linear_actuator_msgs-source";
        url = "https://github.com/ros2-gbp/astuff_sensor_msgs-release.git";
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
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "The kartech_linear_actuator_msgs package";
  };
}
