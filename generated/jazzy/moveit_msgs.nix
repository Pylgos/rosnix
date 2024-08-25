{
  action_msgs,
  ament_cmake,
  ament_lint_auto,
  ament_lint_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  object_recognition_msgs,
  octomap_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  shape_msgs,
  std_msgs,
  substituteSource,
  trajectory_msgs,
}:
let
  sources = rec {
    moveit_msgs = substituteSource {
      src = fetchgit {
        name = "moveit_msgs-source";
        url = "https://github.com/ros2-gbp/moveit_msgs-release.git";
        rev = "1225bd68c7aaae83a9d763303e0b2ac909b3062a";
        hash = "sha256-xpAnqhbeUYf85S2GbiQw9gxJsrS6zLTPMNFaUetjRtY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_msgs";
  version = "2.5.0-1";
  src = sources.moveit_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs geometry_msgs object_recognition_msgs octomap_msgs rosidl_default_runtime sensor_msgs shape_msgs std_msgs trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "Messages, services and actions used by MoveIt";
  };
}
