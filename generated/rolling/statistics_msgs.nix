{
  ament_cmake,
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
    statistics_msgs = substituteSource {
      src = fetchgit {
        name = "statistics_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "56895ab09c1f7b1420d45dffa4e0dcb63aa42573";
        hash = "sha256-StmM/vqSkqqgg84bt4x/hUKy7R7QgDmBoDzsFvBrucw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "statistics_msgs";
  version = "2.2.0-1";
  src = sources.statistics_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Message definitions for reporting statistics for topics and system resources.";
  };
}
