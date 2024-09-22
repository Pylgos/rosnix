{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    statistics_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "statistics_msgs-source";
        owner = "ros2-gbp";
        repo = "rcl_interfaces-release";
        rev = "bf5c981ef3868ed225cf3f713e4724c67397ae4c";
        hash = "sha256-UcbiXBuVNpueB6FiqFoeqrJbmQb7HE6x1f4ZWlQ2U7U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "statistics_msgs";
  version = "2.0.2-2";
  src = sources.statistics_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Message definitions for reporting statistics for topics and system resources.";
  };
}
