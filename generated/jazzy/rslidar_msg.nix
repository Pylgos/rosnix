{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rslidar_msg = substituteSource {
      src = fetchgit {
        name = "rslidar_msg-source";
        url = "https://github.com/ros2-gbp/rslidar_msg-release.git";
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
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rclcpp rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "ros msgs for the rslidar_sdk project";
  };
}
