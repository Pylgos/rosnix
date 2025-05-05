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
  pname = "etsi_its_spatem_ts_msgs";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_spatem_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment rosidl-default-runtime std-msgs ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ ros-environment rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_spatem_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_spatem_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "5b0170f809d04102b098b8eecfee1a78be753fb4";
        hash = "sha256-qg6sFscRoH2yJPqZ7gTLjeYhgr86eI7ccnIhLpL9DMM=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS SPATEM (TS)";
  };
})
