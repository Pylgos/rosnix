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
  pname = "etsi_its_cpm_ts_msgs";
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cpm_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cpm_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cpm_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "9abd66947b353d0596d62bb8c9e97e911d60770e";
        hash = "sha256-4LwxX8Ht4kvOwNFznYHOXNLPiULGqL7vnQNdnJD0td8=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS CPM (TS)";
  };
})
