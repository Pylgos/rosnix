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
  version = "3.0.0-1";
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
        rev = "5e8267a5b214395a893c03bd63ee7cd42dd643e9";
        hash = "sha256-O6V4tC6y5EF4jNe620Tj3OLcAj8DCiAKcG4hLz3HtDA=";
      };
    };
  });
  meta = {
    description = "Provides a ublox_gps node for u-blox GPS receivers, messages, and serialization packages for the binary UBX protocol.";
  };
})
