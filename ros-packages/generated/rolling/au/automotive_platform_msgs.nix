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
    automotive_platform_msgs-4e9bb5fba5ecceab04c7735889f0c0bf9c6cc2b1 = substituteSource {
      src = fetchgit {
        name = "automotive_platform_msgs-4e9bb5fba5ecceab04c7735889f0c0bf9c6cc2b1-source";
        url = "https://github.com/ros2-gbp/automotive_autonomy_msgs-release.git";
        rev = "4e9bb5fba5ecceab04c7735889f0c0bf9c6cc2b1";
        hash = "sha256-HMhXhLS41h9P1STIbuEdhOgxNORj/YJrfDldGKeMKfA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "automotive_platform_msgs";
  version = "3.0.4-5";
  src = sources.automotive_platform_msgs-4e9bb5fba5ecceab04c7735889f0c0bf9c6cc2b1;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Generic Messages for Communication with an Automotive Autonomous Platform";
  };
}
