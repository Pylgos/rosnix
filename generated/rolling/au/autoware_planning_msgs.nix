{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
  unique_identifier_msgs,
}:
let
  sources = rec {
    autoware_planning_msgs-eb99e473620f479a307c633624ee01a7705a7390 = substituteSource {
      src = fetchgit {
        name = "autoware_planning_msgs-eb99e473620f479a307c633624ee01a7705a7390-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "eb99e473620f479a307c633624ee01a7705a7390";
        hash = "sha256-BrRhj72+4kvRvHLaCv9roAUChrtG4jbulSwy8eF02VY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_planning_msgs";
  version = "1.1.0-1";
  src = sources.autoware_planning_msgs-eb99e473620f479a307c633624ee01a7705a7390;
  nativeBuildInputs = [ ament_cmake_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs nav_msgs rosidl_default_runtime std_msgs unique_identifier_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Autoware planning messages package.";
  };
}
