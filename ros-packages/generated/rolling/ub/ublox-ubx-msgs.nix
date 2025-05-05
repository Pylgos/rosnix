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
  version = "0.5.5-4";
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
        rev = "14156e77b6122698534c665c0f00cfc661f04c6c";
        hash = "sha256-36kyMOkdWTPSZ7gGLbzF/dPdiI7AL3oPPr/n6CrH60Q=";
      };
    };
  });
  meta = {
    description = "UBLOX UBX ROS2 Msgs";
  };
})
