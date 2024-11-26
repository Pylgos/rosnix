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
  version = "0.5.4-1";
  src = finalAttrs.passthru.sources."ublox_ubx_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ublox_ubx_msgs" = substituteSource {
        src = fetchgit {
          name = "ublox_ubx_msgs-source";
          url = "https://github.com/ros2-gbp/ublox_dgnss-release.git";
          rev = "8bc1f80c8d3337f370f9b975c1b877e03b8e8ece";
          hash = "sha256-rBY8JJGYz4cmcT/mc+W+E7s+zL5tFeK6IWQZsdW0BgQ=";
        };
      };
    });
  };
  meta = {
    description = "UBLOX UBX ROS2 Msgs";
  };
})
