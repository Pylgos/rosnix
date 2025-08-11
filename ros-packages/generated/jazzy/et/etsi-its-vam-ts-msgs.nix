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
  pname = "etsi_its_vam_ts_msgs";
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_vam_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_vam_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_vam_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "b10b86feb867c2bb0e50d324c9d0f7400386bf90";
        hash = "sha256-qIRPSmYZ4MWFHNnvGXOHvYoynRcUPS6pGlY5U/lhc5M=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS VAM (TS)";
  };
})
