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
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."etsi_its_spatem_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_spatem_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_spatem_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "9386381fd54f37205b60253a8a8f4149f31be550";
        hash = "sha256-akAIHA0bHrTRYwGeiqwAStTSO2frV0fmNWNhADwwTOA=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS SPATEM (TS)";
  };
})
