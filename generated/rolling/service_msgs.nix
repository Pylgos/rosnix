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
  rosidl_core_generators,
  rosidl_core_runtime,
  substituteSource,
}:
let
  sources = rec {
    service_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "service_msgs-source";
        owner = "ros2-gbp";
        repo = "rcl_interfaces-release";
        rev = "f9bf1b377de941796c64e767b153c766e7c561bf";
        hash = "sha256-eA+Wq22eZ7Jmeh8Q0q99Ji9gdKgAzlDige6OxDalRhs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "service_msgs";
  version = "2.2.0-1";
  src = sources.service_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_core_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_core_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Messages definitions common among all ROS services";
  };
}
