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
  pname = "etsi_its_denm_ts_msgs";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_denm_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "f5b640e1634f08b21bef5f4f522f2686174811fb";
        hash = "sha256-WT09bxldNSueonwFe/JwMQWUTGUzTRESV6s6eP63c/M=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS DENM (TS)";
  };
})
