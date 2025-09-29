{
  ament-cmake,
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
  pname = "ackermann_nlmpc_msgs";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."ackermann_nlmpc_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ackermann_nlmpc_msgs" = substituteSource {
      src = fetchgit {
        name = "ackermann_nlmpc_msgs-source";
        url = "https://github.com/ros2-gbp/ackmerann_nlmpc-release.git";
        rev = "adecf95eee3fadc93c6772d496e76a833cffb0b6";
        hash = "sha256-xdq99GA4hTOvf2CYTIMrfJUGVlYch23uYNPESYHgnZc=";
      };
    };
  });
  meta = {
    description = "Message definitions for ackermann_nlmpc";
  };
})
