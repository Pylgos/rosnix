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
  version = "3.4.0-1";
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
        rev = "7d2213a8442530b846b8da79952a76fc3167e84a";
        hash = "sha256-7v3zpyKCvJPJp7sJPSbudLa1+CpMbPzNgfDArOEPC4E=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS VAM (TS)";
  };
})
