{
  action_msgs,
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_core_runtime,
  service_msgs,
  substituteSource,
}:
let
  sources = rec {
    rosidl_default_runtime = substituteSource {
      src = fetchgit {
        name = "rosidl_default_runtime-source";
        url = "https://github.com/ros2-gbp/rosidl_defaults-release.git";
        rev = "d25a92b065e9f454ed6e96e89c07d61cc7f96ce9";
        hash = "sha256-vjsipJB0+/VPIsA3LK9gH6WS/Eai0uZ3YKW3TRptp7Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_default_runtime";
  version = "1.6.0-3";
  src = sources.rosidl_default_runtime;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rosidl_core_runtime service_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A configuration package defining the runtime for the ROS interfaces.";
  };
}
