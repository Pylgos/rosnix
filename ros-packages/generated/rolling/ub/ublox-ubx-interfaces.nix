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
  version = "0.5.5-4";
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
        rev = "f9dbf950749b632694853d489bdd9cdf0c6e9741";
        hash = "sha256-Yo5r/llWF1gykB98LNo9vwt+lrORnhvF7Lc/bLgwhIg=";
      };
    };
  });
  meta = {
    description = "UBLOX UBX Interfaces";
  };
})
