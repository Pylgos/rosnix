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
        rev = "12ada02c781e18aef01dc69973206662fc87ab4b";
        hash = "sha256-SovP7aJEnj43eO5TW1SAqqteW/DQtfYWtr9rP9mJn/k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "service_msgs";
  version = "2.0.2-2";
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
