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
  pname = "etsi_its_denm_ts_msgs";
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_denm_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "8b20881355b9b3145bef3e72dc2009923e69602e";
        hash = "sha256-71zQ4hFIZFz43HyGE491HcUN388NhdUrFTjJLRuTkIg=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS DENM (TS)";
  };
})
