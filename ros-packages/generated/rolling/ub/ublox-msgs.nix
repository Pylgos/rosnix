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
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."ublox_msgs";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rosidl-default-generators sensor-msgs std-msgs ublox-serialization ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rosidl-default-generators sensor-msgs std-msgs ublox-serialization ];
  passthru.sources = mkSourceSet (sources: {
    "ublox_msgs" = substituteSource {
      src = fetchgit {
        name = "ublox_msgs-source";
        url = "https://github.com/ros2-gbp/ublox-release.git";
        rev = "f6f11fc9d9928460256305a6fa110b55ce96335e";
        hash = "sha256-g6BkE0RXsUrQxxAqM42DNvbxZ+rnK9W82M3/1DIOC7Y=";
      };
    };
  });
  meta = {
    description = "\n\n     ublox_msgs contains raw messages for u-blox GNSS devices.\n\n  ";
  };
})
