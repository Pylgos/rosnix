{
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_mapem_ts_msgs";
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."etsi_its_mapem_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment rosidl-default-runtime std-msgs ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ ros-environment rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_mapem_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_mapem_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "08815ef33b60badefb42b33ef5f7521a41eeb019";
        hash = "sha256-J7fgRRAOPZEpuUV/5GL306O/vhvReJQibihQFgKvv78=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS MAPEM (TS)";
  };
})
