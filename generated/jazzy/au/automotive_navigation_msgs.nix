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
  rosSystemPackages,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    automotive_navigation_msgs-a7a4af96be7bcd5fb697f17127c2e7b3364b993b = substituteSource {
      src = fetchgit {
        name = "automotive_navigation_msgs-a7a4af96be7bcd5fb697f17127c2e7b3364b993b-source";
        url = "https://github.com/ros2-gbp/automotive_autonomy_msgs-release.git";
        rev = "a7a4af96be7bcd5fb697f17127c2e7b3364b993b";
        hash = "sha256-N+QDJUyFWyIto9hqSOYNMPTrVLJR+tIO2J4ExUZ27+0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "automotive_navigation_msgs";
  version = "3.0.4-6";
  src = sources.automotive_navigation_msgs-a7a4af96be7bcd5fb697f17127c2e7b3364b993b;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Generic Messages for Navigation Objectives in Automotive Automation Software";
  };
}
