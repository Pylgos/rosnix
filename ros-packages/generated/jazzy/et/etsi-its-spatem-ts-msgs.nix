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
  version = "3.2.1-1";
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
        rev = "a3d7e7ecbaf5951cc5b6f4bb634b5986343149ed";
        hash = "sha256-r6z/7h+7Gcvz/LdXUqexwUdILAAGl6a6bzKAQmZNegE=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS SPATEM (TS)";
  };
})
