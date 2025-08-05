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
  version = "0.6.1-1";
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
        rev = "d3d03ea55e5f7f01f2f48e4b56aaa45092844b4f";
        hash = "sha256-r1wlnhzdeWBHFPGHmkBFjMugCyu7dPDvJ/0qw6SUQMw=";
      };
    };
  });
  meta = {
    description = "Provides a ublox_dgnss node for a u-blox GPS DGNSS receiver using Gen 9 UBX Protocol";
  };
})
