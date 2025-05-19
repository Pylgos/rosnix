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
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment rosidl-default-runtime std-msgs ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ ros-environment rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_denm_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "dbb42eed9100b0e524e0792a366cc50b7e310dc1";
        hash = "sha256-ByHW8ANDDOBpG76Mtzjt1+n9yIuFp/BMQxKxEB9DMfU=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS DENM";
  };
})
