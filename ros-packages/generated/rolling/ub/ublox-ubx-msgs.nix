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
  version = "0.5.8-1";
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
        rev = "cd08f77a2d434ad25cacf681d0d6e1feb7bc9a24";
        hash = "sha256-g/liGN25jyXCb7Ux2WbIU5CP0TxpZSgluc56SDlqhQ4=";
      };
    };
  });
  meta = {
    description = "UBLOX UBX ROS2 Msgs";
  };
})
