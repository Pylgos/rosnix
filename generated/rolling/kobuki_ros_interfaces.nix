{
  action_msgs,
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
    kobuki_ros_interfaces = substituteSource {
      src = fetchgit {
        name = "kobuki_ros_interfaces-source";
        url = "https://github.com/ros2-gbp/kobuki_ros_interfaces-release.git";
        rev = "9820a7d8eccd0f20c0fe747a6140d60bd782419a";
        hash = "sha256-svbQG6e1o4u1HncdcNcx55XoYK99I02G7CxL2jvBZhs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kobuki_ros_interfaces";
  version = "1.0.0-4";
  src = sources.kobuki_ros_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "";
  };
}
