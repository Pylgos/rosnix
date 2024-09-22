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
  rclcpp,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rslidar_msg = substituteSource {
      src = fetchFromGitHub {
        name = "rslidar_msg-source";
        owner = "ros2-gbp";
        repo = "rslidar_msg-release";
        rev = "c179432169346c66a82bf4e003eea95df144ea1f";
        hash = "sha256-hoIl9SGx6AoaPdOqKDzxdwuXznCZhGG3cNJvuGb9OPg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rslidar_msg";
  version = "0.0.0-1";
  src = sources.rslidar_msg;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rclcpp rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ros msgs for the rslidar_sdk project";
  };
}
