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
    std_msgs = substituteSource {
      src = fetchgit {
        name = "std_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "6caa3d659eddf3f3520a563afd579207e7b0e060";
        hash = "sha256-ZlucnBjZl0ribV8kErdUu63DstFByzgVOh4X6GEJvCk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "std_msgs";
  version = "5.4.1-1";
  src = sources.std_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing some standard message definitions.";
  };
}
