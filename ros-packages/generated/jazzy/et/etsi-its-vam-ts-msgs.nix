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
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_vam_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_vam_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_vam_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "90f69a9b18d38684b1cb1b293467c96de1ddd11e";
        hash = "sha256-+Ffg/vB2B/hXEz2Zxc5WPD2V9a5KAPPVMmEE/JzyXaM=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS VAM (TS)";
  };
})
