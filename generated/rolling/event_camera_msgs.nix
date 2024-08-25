{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    event_camera_msgs = substituteSource {
      src = fetchgit {
        name = "event_camera_msgs-source";
        url = "https://github.com/ros2-gbp/event_camera_msgs-release.git";
        rev = "3b6c787c53375507d0c470b3b9d06ab4785d444e";
        hash = "sha256-eSVTxQf3iPYpb2cQQHGiBixNwRVKCsDQ9qfGRKzk6vI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "event_camera_msgs";
  version = "1.0.6-1";
  src = sources.event_camera_msgs;
  nativeBuildInputs = [ ament_cmake ros_environment ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "messages for event based cameras";
  };
}
