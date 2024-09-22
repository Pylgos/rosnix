{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_core_generators,
  rosidl_core_runtime,
  service_msgs,
  substituteSource,
}:
let
  sources = rec {
    type_description_interfaces = substituteSource {
      src = fetchFromGitHub {
        name = "type_description_interfaces-source";
        owner = "ros2-gbp";
        repo = "rcl_interfaces-release";
        rev = "457d2d32df52e364022352bf9c377b778082891b";
        hash = "sha256-E3QuQ0C5Hk5c5RcbjRJoZuENdkYjG05x5X3YyMhA85Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "type_description_interfaces";
  version = "2.2.0-1";
  src = sources.type_description_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_core_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_core_runtime service_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing message and service definitions for describing and communicating descriptions of other types.";
  };
}
