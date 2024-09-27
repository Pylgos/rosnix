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
    rcl_interfaces-e0b26d848e6c01ef9da18034a07afe8053aedd4b = substituteSource {
      src = fetchgit {
        name = "rcl_interfaces-e0b26d848e6c01ef9da18034a07afe8053aedd4b-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "e0b26d848e6c01ef9da18034a07afe8053aedd4b";
        hash = "sha256-3gKhh4yvrtEOlm1SS67JYGCOs3dbTv2K/VtSHlCKVf4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_interfaces";
  version = "2.2.0-1";
  src = sources.rcl_interfaces-e0b26d848e6c01ef9da18034a07afe8053aedd4b;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ROS client library common interfaces. This package contains the messages and services which ROS client libraries will use under the hood to communicate higher level concepts such as parameters.";
  };
}
