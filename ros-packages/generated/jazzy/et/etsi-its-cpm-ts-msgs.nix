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
  pname = "etsi_its_cpm_ts_msgs";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cpm_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cpm_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cpm_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "82584d272057388f039ebde8a49d06b5319e5287";
        hash = "sha256-lVVou7gIHMuFTdNPDYRoHi+EFivAuH53gBFVy1UKImI=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS CPM (TS)";
  };
})
