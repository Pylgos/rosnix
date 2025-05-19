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
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment rosidl-default-runtime std-msgs ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ ros-environment rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_denm_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "fc4ac1857a4dae7dfaa17e4ae153d3904952194a";
        hash = "sha256-B3F/Q2ha3xMfUPdk5np9kuO6nvrgURCH+Hdv7jqtEA0=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS DENM (TS)";
  };
})
