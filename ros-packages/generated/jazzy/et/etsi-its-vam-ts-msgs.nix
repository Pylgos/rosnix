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
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."etsi_its_vam_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_vam_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_vam_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "9fa06d44bad0bc3e0b5a6510e4a996857d4b1b30";
        hash = "sha256-Vnr4XItJ2H/6CMpgxZW77cZ0LdWdb7m1pEVD/X8fn9g=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS VAM (TS)";
  };
})
