{
  buildAmentCmakePackage,
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
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_mapem_ts_msgs";
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_mapem_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_mapem_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_mapem_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "e4227efe8251fbdce7e38cde7543ad469d63df25";
        hash = "sha256-aIner8cTcM3IEk31Fu1rqcyG9soxPvf4Qkwa8LZW1cM=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS MAPEM (TS)";
  };
})
