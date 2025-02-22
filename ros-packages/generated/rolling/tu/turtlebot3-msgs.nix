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
        rev = "336d7e49df34b1e63dcd466de7280f0d9d16b42a";
        hash = "sha256-UAF6r9jlQPRsfWpMKtRlU66TrYkul8Dgac3DgarW1k8=";
      };
    };
  });
  meta = {
    description = "Message and service types: custom messages and services for TurtleBot3 packages for ROS 2";
  };
})
