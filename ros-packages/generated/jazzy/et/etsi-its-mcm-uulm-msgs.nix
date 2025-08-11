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
  pname = "etsi_its_mcm_uulm_msgs";
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_mcm_uulm_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_mcm_uulm_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_mcm_uulm_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "78fae54c1a3364f97a00228d0c3508371f9b5d14";
        hash = "sha256-myDghaPxabQABXxukg9uZOKBDW/+nXT2EvrqNV1JASk=";
      };
    };
  });
  meta = {
    description = "ROS messages for draft MCM (TS) version of UULM";
  };
})
