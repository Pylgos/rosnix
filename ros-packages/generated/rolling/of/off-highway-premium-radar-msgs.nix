{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "off_highway_premium_radar_msgs";
  version = "1.3.0-2";
  src = finalAttrs.passthru.sources."off_highway_premium_radar_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_premium_radar_msgs" = substituteSource {
      src = fetchgit {
        name = "off_highway_premium_radar_msgs-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "ad240152f2821b0b01d0164f213f287c7ddb436c";
        hash = "sha256-DTgZc2ugukknGVY0tFjHJXqrdLL9qZGzzHg2tP8/vWA=";
      };
    };
  });
  meta = {
    description = "The off_highway_premium_radar_msgs package";
  };
})
