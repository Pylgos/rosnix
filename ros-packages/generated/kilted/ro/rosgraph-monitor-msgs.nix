{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosgraph_monitor_msgs";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."rosgraph_monitor_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rcl-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rcl-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "rosgraph_monitor_msgs" = substituteSource {
      src = fetchgit {
        name = "rosgraph_monitor_msgs-source";
        url = "https://github.com/ros2-gbp/graph_monitor-release.git";
        rev = "3e9c073508d0761fc38470b4f4b277bed9c40b33";
        hash = "sha256-s+FlRcHE6+zJqtLM7c7jOokbWBQKnUarXRpHA+q7iOY=";
      };
    };
  });
  meta = {
    description = "Interfaces for reporting observations about the ROS 2 communication graph";
  };
})
