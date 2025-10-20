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
  pname = "etsi_its_spatem_ts_msgs";
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_spatem_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_spatem_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_spatem_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "def0368a07d883697dd92b2d388333a3dae3c624";
        hash = "sha256-vI09f6lvDFL/YoGkdb4Lj4DkLjyHvM8h+7xu7lNWoqM=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS SPATEM (TS)";
  };
})
