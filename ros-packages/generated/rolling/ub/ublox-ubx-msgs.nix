{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ublox_ubx_msgs";
  version = "0.5.7-1";
  src = finalAttrs.passthru.sources."ublox_ubx_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ublox_ubx_msgs" = substituteSource {
      src = fetchgit {
        name = "ublox_ubx_msgs-source";
        url = "https://github.com/ros2-gbp/ublox_dgnss-release.git";
        rev = "c89d9f975b6fe4cc717aa028f970c917a53493dd";
        hash = "sha256-skPsJXBidxUKT/JB31OR5YQmnH3v0X5BnxoZlj3H8b0=";
      };
    };
  });
  meta = {
    description = "UBLOX UBX ROS2 Msgs";
  };
})
