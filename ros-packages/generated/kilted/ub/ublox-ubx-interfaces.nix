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
  version = "0.5.7-1";
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
        rev = "30ec721fd78bf019bb1950ee5fabbe66be35e0cd";
        hash = "sha256-SLH5J0W7MomOUx6QOUjvjhFS5EIvna4ouatocHaNjLo=";
      };
    };
  });
  meta = {
    description = "UBLOX UBX Interfaces";
  };
})
