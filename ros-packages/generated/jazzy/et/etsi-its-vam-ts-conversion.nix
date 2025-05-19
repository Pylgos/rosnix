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
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."etsi_its_vam_ts_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-primitives-conversion etsi-its-vam-ts-coding etsi-its-vam-ts-msgs ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-primitives-conversion etsi-its-vam-ts-coding etsi-its-vam-ts-msgs ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_vam_ts_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_vam_ts_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "23bfa4bcac279e6431ab37899b4bc804e87cc832";
        hash = "sha256-wxfDZSgTi4h7xY9xAZoG8f83OqFUVjctj+3YKBqlwDw=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS VAMs (TS)";
  };
})
