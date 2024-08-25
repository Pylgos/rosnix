{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
  trajectory_msgs,
}:
let
  sources = rec {
    gazebo_msgs = substituteSource {
      src = fetchgit {
        name = "gazebo_msgs-source";
        url = "https://github.com/ros2-gbp/gazebo_ros_pkgs-release.git";
        rev = "a376d73c2086fdfe468d6ad4b6a6464797a6588b";
        hash = "sha256-sTnxrWA90gEXxma5YwKDCuk5gkRgjnFuZK9xRQes9cQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gazebo_msgs";
  version = "3.8.0-1";
  src = sources.gazebo_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Message and service data structures for interacting with Gazebo from ROS2.";
  };
}
