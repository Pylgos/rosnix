{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
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
  pname = "ros2_socketcan_msgs";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."ros2_socketcan_msgs";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_socketcan_msgs" = substituteSource {
      src = fetchgit {
        name = "ros2_socketcan_msgs-source";
        url = "https://github.com/ros2-gbp/ros2_socketcan-release.git";
        rev = "ad6d4962edd86e81eef43390316970e54ab89279";
        hash = "sha256-CdTyUOxtcJWtdaWIWAMV8DBwNPVcpobmkdjvFqDo8xE=";
      };
    };
  });
  meta = {
    description = "Messages for SocketCAN";
  };
})
