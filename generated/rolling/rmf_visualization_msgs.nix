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
    rmf_visualization_msgs = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_visualization_msgs-release.git";
        rev = "7b107b018fad7d99d9c691d45415999f9debb04d";
        hash = "sha256-5vCaDnG4VwG8KZl0dVZzN0hUxcShW5mwtlwFt6ktAk4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_msgs";
  version = "1.5.0-1";
  src = sources.rmf_visualization_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing messages used for visualizations";
  };
}
