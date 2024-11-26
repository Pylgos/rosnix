{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-primitives-conversion,
  etsi-its-vam-ts-coding,
  etsi-its-vam-ts-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_vam_ts_conversion";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_vam_ts_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ etsi-its-primitives-conversion etsi-its-vam-ts-coding etsi-its-vam-ts-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "etsi_its_vam_ts_conversion" = substituteSource {
        src = fetchgit {
          name = "etsi_its_vam_ts_conversion-source";
          url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
          rev = "d66b809ca2528e059719df0ee0c6a52cba28aa9b";
          hash = "sha256-/9iOKxMhuIeyqfTIMPzQ+EQ1dT2PErzvMRkP+iyUKvY=";
        };
      };
    });
  };
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS VAMs (TS)";
  };
})
