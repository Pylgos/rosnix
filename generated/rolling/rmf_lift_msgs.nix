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
    rmf_lift_msgs = substituteSource {
      src = fetchgit {
        name = "rmf_lift_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "47e7f0433842907f577dc61d1bb14cd6531ec045";
        hash = "sha256-P60bQUYpYAqY7bJZ5+MaYcal6Lj0EHdjiFX9ef5ic24=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_lift_msgs";
  version = "3.4.0-1";
  src = sources.rmf_lift_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Messages used to interface to lifts.";
  };
}
