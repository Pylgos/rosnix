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
  pname = "off_highway_premium_radar_sample_msgs";
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."off_highway_premium_radar_sample_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_premium_radar_sample_msgs" = substituteSource {
      src = fetchgit {
        name = "off_highway_premium_radar_sample_msgs-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "a94969b026fc0722b27d423010cd9db71414c144";
        hash = "sha256-e55ZZH7sER97kb5GAIrWffvFfnvUZSiDSp6O2tphw+A=";
      };
    };
  });
  meta = {
    description = "The off_highway_premium_radar_sample_msgs package";
  };
})
