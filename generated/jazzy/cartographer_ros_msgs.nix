{
  ament_cmake,
  ament_lint_auto,
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
}:
let
  sources = rec {
    cartographer_ros_msgs = substituteSource {
      src = fetchgit {
        name = "cartographer_ros_msgs-source";
        url = "https://github.com/ros2-gbp/cartographer_ros-release.git";
        rev = "9a63c21a390bff45650200ccf82af75957ba8dec";
        hash = "sha256-POmR42dN/mrsnISU7egd4dQ/y+W+VWvPUwQK+JlLCeU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "cartographer_ros_msgs";
  version = "2.0.9003-2";
  src = sources.cartographer_ros_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "ROS messages for the cartographer_ros package.";
  };
}
