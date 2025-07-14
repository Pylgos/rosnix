{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ntrip-client-node,
  rosSystemPackages,
  substituteSource,
  ublox-dgnss-node,
  ublox-nav-sat-fix-hp-node,
  ublox-ubx-interfaces,
  ublox-ubx-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ublox_dgnss";
  version = "0.5.8-1";
  src = finalAttrs.passthru.sources."ublox_dgnss";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ntrip-client-node ublox-dgnss-node ublox-nav-sat-fix-hp-node ublox-ubx-interfaces ublox-ubx-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ntrip-client-node ublox-dgnss-node ublox-nav-sat-fix-hp-node ublox-ubx-interfaces ublox-ubx-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ublox_dgnss" = substituteSource {
      src = fetchgit {
        name = "ublox_dgnss-source";
        url = "https://github.com/ros2-gbp/ublox_dgnss-release.git";
        rev = "2d85a4f2109aaabf6aff984b67b86269f3796d58";
        hash = "sha256-qf+jh2CbsJHIPDnoOMiMP1SElimd4rRfASFB/viLzE0=";
      };
    };
  });
  meta = {
    description = "Provides a ublox_dgnss node for a u-blox GPS DGNSS receiver using Gen 9 UBX Protocol";
  };
})
