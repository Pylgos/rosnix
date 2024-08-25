{
  ament_cmake_auto,
  ament_lint_auto,
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
    ros2_socketcan_msgs = substituteSource {
      src = fetchgit {
        name = "ros2_socketcan_msgs-source";
        url = "https://github.com/ros2-gbp/ros2_socketcan-release.git";
        rev = "181e851e78d05f6211aef8b74e106d09979bebbd";
        hash = "sha256-CdTyUOxtcJWtdaWIWAMV8DBwNPVcpobmkdjvFqDo8xE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2_socketcan_msgs";
  version = "1.3.0-1";
  src = sources.ros2_socketcan_msgs;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Messages for SocketCAN";
  };
}
