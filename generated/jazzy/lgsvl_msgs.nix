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
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    lgsvl_msgs = substituteSource {
      src = fetchgit {
        name = "lgsvl_msgs-source";
        url = "https://github.com/ros2-gbp/lgsvl_msgs-release.git";
        rev = "df62ae3eea8caa26f3b54f6c394ca369ddfa63be";
        hash = "sha256-Pd5TP0wLuUr0/m+WvLpkvURpB0d0hbik3SOPkifg8YU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lgsvl_msgs";
  version = "0.0.4-5";
  src = sources.lgsvl_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Message definitions for interfacing with the LGSVL Simulator for ROS and ROS 2.";
  };
}
