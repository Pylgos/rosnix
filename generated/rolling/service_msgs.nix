{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_core_generators,
  rosidl_core_runtime,
  substituteSource,
}:
let
  sources = rec {
    service_msgs = substituteSource {
      src = fetchgit {
        name = "service_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "f9bf1b377de941796c64e767b153c766e7c561bf";
        hash = "sha256-eA+Wq22eZ7Jmeh8Q0q99Ji9gdKgAzlDige6OxDalRhs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "service_msgs";
  version = "2.2.0-1";
  src = sources.service_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_core_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_core_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Messages definitions common among all ROS services";
  };
}
