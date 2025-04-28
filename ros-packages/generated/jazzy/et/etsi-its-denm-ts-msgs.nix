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
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_denm_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "cfbbd4c9becc2532f6daa79b22e1feb9e3b86a45";
        hash = "sha256-yItkeSe1MiV/GUfn0+10Ub8Y3HVc0F4K0Pd201mFvpE=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS DENM (TS)";
  };
})
