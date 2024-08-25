{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    rcl_interfaces = substituteSource {
      src = fetchgit {
        name = "rcl_interfaces-source";
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
  src = sources.rcl_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "The ROS client library common interfaces. This package contains the messages and services which ROS client libraries will use under the hood to communicate higher level concepts such as parameters.";
  };
}
