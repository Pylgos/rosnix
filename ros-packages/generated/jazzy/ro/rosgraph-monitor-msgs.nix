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
        rev = "1347cb927f8f7eb71f3c16a1169074b48155170b";
        hash = "sha256-spJdQ70zAkdbr/xCL8Qzx/NFeNe+5loVtMqnUN5slYY=";
      };
    };
  });
  meta = {
    description = "Interfaces for reporting observations about the ROS 2 communication graph";
  };
})
