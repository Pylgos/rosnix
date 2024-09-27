{
  action_msgs,
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    turtlebot3_msgs-b8b5a3842c7e91d15970bcfeb1879deb395a62ee = substituteSource {
      src = fetchgit {
        name = "turtlebot3_msgs-b8b5a3842c7e91d15970bcfeb1879deb395a62ee-source";
        url = "https://github.com/ros2-gbp/turtlebot3_msgs-release.git";
        rev = "b8b5a3842c7e91d15970bcfeb1879deb395a62ee";
        hash = "sha256-AfTC3VY2EzfPdav7DvNaPrB+NM5laHjJRrpSaWfb2Cw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_msgs";
  version = "2.2.1-4";
  src = sources.turtlebot3_msgs-b8b5a3842c7e91d15970bcfeb1879deb395a62ee;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action_msgs builtin_interfaces rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Message and service types: custom messages and services for TurtleBot3 packages for ROS2";
  };
}
