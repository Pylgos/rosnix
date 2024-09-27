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
  rosSystemPackages,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    lgsvl_msgs-df62ae3eea8caa26f3b54f6c394ca369ddfa63be = substituteSource {
      src = fetchgit {
        name = "lgsvl_msgs-df62ae3eea8caa26f3b54f6c394ca369ddfa63be-source";
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
  src = sources.lgsvl_msgs-df62ae3eea8caa26f3b54f6c394ca369ddfa63be;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Message definitions for interfacing with the LGSVL Simulator for ROS and ROS 2.";
  };
}
