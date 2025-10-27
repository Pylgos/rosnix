{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl-interfaces,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosgraph_monitor_msgs";
  version = "0.2.3-1";
  src = finalAttrs.passthru.sources."rosgraph_monitor_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rcl-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rcl-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosgraph_monitor_msgs" = substituteSource {
      src = fetchgit {
        name = "rosgraph_monitor_msgs-source";
        url = "https://github.com/ros2-gbp/graph_monitor-release.git";
        rev = "4ee793548046545843c49a83030d1aa385116652";
        hash = "sha256-DtdW3AvjspLPSRclB9vmrx0MP4I/lAxO5qaTbgjS2Cg=";
      };
    };
  });
  meta = {
    description = "Interfaces for reporting observations about the ROS 2 communication graph";
  };
})
