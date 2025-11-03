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
  version = "0.7.0-1";
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
        rev = "c789f4a386ec306fe915894ef3ce68aa408d42cf";
        hash = "sha256-Ml5vclFH7ZT2+zCaKcn3O49igdKaNa7McKBkCp1OvQM=";
      };
    };
  });
  meta = {
    description = "UBLOX UBX Interfaces";
  };
})
