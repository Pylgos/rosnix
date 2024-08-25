{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    lifecycle_msgs = substituteSource {
      src = fetchgit {
        name = "lifecycle_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "ddb42bf295aa855c6f8b4822093f54b0dfd2d1c9";
        hash = "sha256-+Oshm+4WjPL5fwRtPypcpz2zKiofzPFw2mbeEyzz9s4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lifecycle_msgs";
  version = "2.2.0-1";
  src = sources.lifecycle_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing some lifecycle related message and service definitions.";
  };
}
