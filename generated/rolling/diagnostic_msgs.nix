{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    diagnostic_msgs = substituteSource {
      src = fetchgit {
        name = "diagnostic_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "7154fea364cabc46edd39c64261c39eeb9807394";
        hash = "sha256-o2VBY/NTRC11cnudQYMtrOY6gtYm7OHndBRG+MXBxdk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diagnostic_msgs";
  version = "5.4.1-1";
  src = sources.diagnostic_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing some diagnostics related message and service definitions.";
  };
}
