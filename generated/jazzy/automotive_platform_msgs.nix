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
    automotive_platform_msgs = substituteSource {
      src = fetchgit {
        name = "automotive_platform_msgs-source";
        url = "https://github.com/ros2-gbp/automotive_autonomy_msgs-release.git";
        rev = "52a0f24bbcbe3b2a5f503ada8e224014cab98b6c";
        hash = "sha256-HMhXhLS41h9P1STIbuEdhOgxNORj/YJrfDldGKeMKfA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "automotive_platform_msgs";
  version = "3.0.4-6";
  src = sources.automotive_platform_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Generic Messages for Communication with an Automotive Autonomous Platform";
  };
}
