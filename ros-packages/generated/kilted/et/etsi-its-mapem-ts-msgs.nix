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
  version = "3.4.0-1";
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
        rev = "e7e11873e7d20f627ff19bdce61771690b44af6a";
        hash = "sha256-3eR7yjfHAd16foQmRJAlBErhbOahurfjR/GNFK1t2jY=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS MAPEM (TS)";
  };
})
