{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosgraph_monitor_msgs";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."rosgraph_monitor_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "rosgraph_monitor_msgs" = substituteSource {
      src = fetchgit {
        name = "rosgraph_monitor_msgs-source";
        url = "https://github.com/ros2-gbp/graph_monitor-release.git";
        rev = "098d55c25892ba7fa544fbd513e6877bbe1ac1e8";
        hash = "sha256-spJdQ70zAkdbr/xCL8Qzx/NFeNe+5loVtMqnUN5slYY=";
      };
    };
  });
  meta = {
    description = "Interfaces for reporting observations about the ROS 2 communication graph";
  };
})
