{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  ublox-gps,
  ublox-msgs,
  ublox-serialization,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ublox";
  version = "2.3.0-3";
  src = finalAttrs.passthru.sources."ublox";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ublox-gps ublox-msgs ublox-serialization ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ublox-gps ublox-msgs ublox-serialization ];
  passthru.sources = mkSourceSet (sources: {
    "ublox" = substituteSource {
      src = fetchgit {
        name = "ublox-source";
        url = "https://github.com/ros2-gbp/ublox-release.git";
        rev = "2d85ed646da6998974f76b2e2dbd086401b46e61";
        hash = "sha256-tCPY6Wu0TQ0Auvkx3xW6yyreMV7K0GruiyS4AZ29LtI=";
      };
    };
  });
  meta = {
    description = "Provides a ublox_gps node for u-blox GPS receivers, messages, and serialization packages for the binary UBX protocol.";
  };
})
