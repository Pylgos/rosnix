{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    automotive_navigation_msgs = substituteSource {
      src = fetchgit {
        name = "automotive_navigation_msgs-source";
        url = "https://github.com/ros2-gbp/automotive_autonomy_msgs-release.git";
        rev = "c1b8531729a747fe72917cd8fb550c59fde82d26";
        hash = "sha256-N+QDJUyFWyIto9hqSOYNMPTrVLJR+tIO2J4ExUZ27+0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "automotive_navigation_msgs";
  version = "3.0.4-5";
  src = sources.automotive_navigation_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Generic Messages for Navigation Objectives in Automotive Automation Software";
  };
}
