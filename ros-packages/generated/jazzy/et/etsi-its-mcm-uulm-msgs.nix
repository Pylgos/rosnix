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
  pname = "etsi_its_mcm_uulm_msgs";
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."etsi_its_mcm_uulm_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment rosidl-default-runtime std-msgs ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ ros-environment rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_mcm_uulm_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_mcm_uulm_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "09c97cd0c31a765cc774eddc5c54e3fc68cb487f";
        hash = "sha256-Z5ggT4G2G8vpyeTOgpjydMj8gGwYehAjoq8j+9YYqwo=";
      };
    };
  });
  meta = {
    description = "ROS messages for draft MCM (TS) version of UULM";
  };
})
