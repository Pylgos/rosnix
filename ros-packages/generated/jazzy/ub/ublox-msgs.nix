{
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  sensor-msgs,
  std-msgs,
  substituteSource,
  ublox-serialization,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ublox_msgs";
  version = "2.3.0-4";
  src = finalAttrs.passthru.sources."ublox_msgs";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ sensor-msgs std-msgs ublox-serialization ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ublox_msgs" = substituteSource {
        src = fetchgit {
          name = "ublox_msgs-source";
          url = "https://github.com/ros2-gbp/ublox-release.git";
          rev = "81c2cba3a487d742189f3022efc01fb794ef7034";
          hash = "sha256-y+4Wac/LAoobvoFcSIJ2PGoih6+tPbrMnRKVg6BxUgM=";
        };
      };
    });
  };
  meta = {
    description = "ublox_msgs contains raw messages for u-blox GNSS devices.";
  };
})
