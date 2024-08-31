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
        rev = "04ce411181937c4209fc24607d0268850384526d";
        hash = "sha256-XMpXzLDmf6wd08+3RqReOHU3WQOahNdVEVkU+/zwzyg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz_interfaces";
  version = "1.0.3-1";
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
