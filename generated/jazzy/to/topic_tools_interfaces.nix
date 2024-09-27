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
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    topic_tools_interfaces-9447181ac14a55192f1d162c49c0798bfd904237 = substituteSource {
      src = fetchgit {
        name = "topic_tools_interfaces-9447181ac14a55192f1d162c49c0798bfd904237-source";
        url = "https://github.com/ros2-gbp/topic_tools-release.git";
        rev = "9447181ac14a55192f1d162c49c0798bfd904237";
        hash = "sha256-5x6LhI6fAyPkc3XkqWV9DjxWKMx85wevw7GVK0R1sxA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "topic_tools_interfaces";
  version = "1.3.1-1";
  src = sources.topic_tools_interfaces-9447181ac14a55192f1d162c49c0798bfd904237;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "topic_tools_interfaces contains messages and services for topic_tools";
  };
}
