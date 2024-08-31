{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rcl_interfaces,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ros_gz_interfaces = substituteSource {
      src = fetchgit {
        name = "ros_gz_interfaces-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "cc78781dac9f396a3f7b6f2e45c5cba031ee029e";
        hash = "sha256-kHSmFuv9xWlDsr7UiKW4XwoMCv/wN8S5LMCHdSYEuWs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz_interfaces";
  version = "2.0.0-1";
  src = sources.ros_gz_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rcl_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Message and service data structures for interacting with Gazebo from ROS2.";
  };
}
