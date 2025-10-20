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
  pname = "etsi_its_denm_msgs";
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_denm_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "9e85ef3cea5a3e7418f8f93a47215e5f250ca2b9";
        hash = "sha256-pv6+wT179ecuLmSekEQotpYmSCJVn2YUr2GVcTG5mL4=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS DENM";
  };
})
