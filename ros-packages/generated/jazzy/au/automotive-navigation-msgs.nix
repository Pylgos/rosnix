{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "automotive_navigation_msgs" = substituteSource {
      src = fetchgit {
        name = "automotive_navigation_msgs-source";
        url = "https://github.com/ros2-gbp/automotive_autonomy_msgs-release.git";
        rev = "a7a4af96be7bcd5fb697f17127c2e7b3364b993b";
        hash = "sha256-N+QDJUyFWyIto9hqSOYNMPTrVLJR+tIO2J4ExUZ27+0=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "automotive_navigation_msgs";
  version = "3.0.4-6";
  src = sources."automotive_navigation_msgs";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros-environment rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Generic Messages for Navigation Objectives in Automotive Automation Software";
  };
}
