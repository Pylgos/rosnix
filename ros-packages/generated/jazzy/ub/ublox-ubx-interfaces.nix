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
  version = "0.5.4-1";
  src = finalAttrs.passthru.sources."ublox_ubx_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ublox_ubx_interfaces" = substituteSource {
      src = fetchgit {
        name = "ublox_ubx_interfaces-source";
        url = "https://github.com/ros2-gbp/ublox_dgnss-release.git";
        rev = "71d117fd6627a5e821fde12a12cd14c0007725d0";
        hash = "sha256-bs+ihGg6yFE5bjCUkndx2y9wLBA0m4wvxZBJaW29oZI=";
      };
    };
  });
  meta = {
    description = "UBLOX UBX Interfaces";
  };
})
