{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ackermann_msgs = substituteSource {
      src = fetchgit {
        name = "ackermann_msgs-source";
        url = "https://github.com/ros2-gbp/ackermann_msgs-release.git";
        rev = "c36723cfed1874827a122ca18bb40401753b0512";
        hash = "sha256-zn0jbHQ6PrAlpzAwpr3Tu01dOE8TVcs0XYlTXL0x8wg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ackermann_msgs";
  version = "2.0.2-6";
  src = sources.ackermann_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "ROS2 messages for robots using Ackermann steering.";
  };
}
