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
  pname = "etsi_its_vam_ts_msgs";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."etsi_its_vam_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_vam_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_vam_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "662bb9754780b9c105910396845babfd8c2be44b";
        hash = "sha256-rWtNOgcZLSFLPfrPHHT8Lr96JmK2/1SoBx8/VpA5S/s=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS VAM (TS)";
  };
})
