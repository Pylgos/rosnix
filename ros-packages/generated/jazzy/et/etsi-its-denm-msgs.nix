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
  pname = "etsi_its_denm_msgs";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_denm_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "e26744ac0d34256964caa5ecbaadc60bcd75aeaa";
        hash = "sha256-gs4OJUbGroUF0lFn/r1MZ4/vy+e6dwvwUECei/QmHgs=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS DENM";
  };
})
