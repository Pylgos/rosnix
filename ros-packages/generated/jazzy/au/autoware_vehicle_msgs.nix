{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  autoware_planning_msgs,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "autoware_vehicle_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_vehicle_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "3acd63a48e658a68324868bddf4d761634286be3";
        hash = "sha256-6aO0NolqbPRlwrCNG4AgviUdoV/VJBIl8qrwZw9uYfw=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "autoware_vehicle_msgs";
  version = "1.1.0-1";
  src = sources."autoware_vehicle_msgs";
  nativeBuildInputs = [ ament_cmake_auto rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ autoware_planning_msgs builtin_interfaces rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Interfaces between core Autoware vehicle components";
  };
}