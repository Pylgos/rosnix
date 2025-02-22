{
  action-msgs,
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_msgs";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."turtlebot3_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_msgs" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_msgs-source";
        url = "https://github.com/ros2-gbp/turtlebot3_msgs-release.git";
        rev = "e92ca73b13ed56908f6b4541eebb720b125e8db4";
        hash = "sha256-UAF6r9jlQPRsfWpMKtRlU66TrYkul8Dgac3DgarW1k8=";
      };
    };
  });
  meta = {
    description = "Message and service types: custom messages and services for TurtleBot3 packages for ROS 2";
  };
})
