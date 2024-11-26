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
  version = "0.5.4-3";
  src = finalAttrs.passthru.sources."ublox_dgnss";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ntrip-client-node ublox-dgnss-node ublox-nav-sat-fix-hp-node ublox-ubx-interfaces ublox-ubx-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ublox_dgnss" = substituteSource {
      src = fetchgit {
        name = "ublox_dgnss-source";
        url = "https://github.com/ros2-gbp/ublox_dgnss-release.git";
        rev = "6431c7a1d8a563222cefc51eb7380985f8f6a11d";
        hash = "sha256-kezU0qcvR8anvIeD6xufYTeiiBRcS8KWLRPN8Z+HKwQ=";
      };
    };
  });
  meta = {
    description = "Provides a ublox_dgnss node for a u-blox GPS DGNSS receiver using Gen 9 UBX Protocol";
  };
})
