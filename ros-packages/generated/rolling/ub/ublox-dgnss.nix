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
  version = "0.5.5-4";
  src = finalAttrs.passthru.sources."ublox_dgnss";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ntrip-client-node ublox-dgnss-node ublox-nav-sat-fix-hp-node ublox-ubx-interfaces ublox-ubx-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ublox_dgnss" = substituteSource {
      src = fetchgit {
        name = "ublox_dgnss-source";
        url = "https://github.com/ros2-gbp/ublox_dgnss-release.git";
        rev = "f0323f198d4e6565b164bbc81639a39e4cddae02";
        hash = "sha256-xmlseDxC0/pBoN9p+LVpz8BUYxQFdIDwzzDVv11ApoI=";
      };
    };
  });
  meta = {
    description = "Provides a ublox_dgnss node for a u-blox GPS DGNSS receiver using Gen 9 UBX Protocol";
  };
})
