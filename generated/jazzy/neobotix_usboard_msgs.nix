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
    neobotix_usboard_msgs = substituteSource {
      src = fetchgit {
        name = "neobotix_usboard_msgs-source";
        url = "https://github.com/ros2-gbp/astuff_sensor_msgs-release.git";
        rev = "4d80630c58872af31fe2bc99eedddb30fe53971b";
        hash = "sha256-dKwQGX4Fl0MagRbLNTnXobUGLXFfems8P6ArP7uljjs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "neobotix_usboard_msgs";
  version = "4.0.0-4";
  src = sources.neobotix_usboard_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "neobotix_usboard package";
  };
}
