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
    neobotix_usboard_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "neobotix_usboard_msgs-source";
        owner = "ros2-gbp";
        repo = "astuff_sensor_msgs-release";
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
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "neobotix_usboard package";
  };
}
