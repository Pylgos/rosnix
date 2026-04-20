{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ublox_ubx_interfaces";
  version = "0.7.4-1";
  src = finalAttrs.passthru.sources."ublox_ubx_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ublox_ubx_interfaces" = substituteSource {
      src = fetchgit {
        name = "ublox_ubx_interfaces-source";
        url = "https://github.com/ros2-gbp/ublox_dgnss-release.git";
        rev = "5844d127da3c1556f16d43e2b816c243d9203538";
        hash = "sha256-PcNB1ItNgYoiTEwELXVRIzRDnlQUB+FzmJ23yW9BK6c=";
      };
    };
  });
  meta = {
    description = "UBLOX UBX Interfaces";
  };
})
