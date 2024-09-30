{
  action-msgs,
  ament-cmake,
  ament-lint-common,
  buildRosPackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "turtlebot3_msgs" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_msgs-source";
        url = "https://github.com/ros2-gbp/turtlebot3_msgs-release.git";
        rev = "bdda58f589ea7a37beb28192ab4830cbed47537f";
        hash = "sha256-AfTC3VY2EzfPdav7DvNaPrB+NM5laHjJRrpSaWfb2Cw=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "turtlebot3_msgs";
  version = "2.2.1-5";
  src = sources."turtlebot3_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Message and service types: custom messages and services for TurtleBot3 packages for ROS2";
  };
}
