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
