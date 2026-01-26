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
  version = "1.0.0-1";
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
        rev = "c5d0d66c12eeae88d41a04e5d6d0e4e16a5ff187";
        hash = "sha256-szNocUFRXTjXp/NYF4L9KRFkt8crkwYllGa9azOAi4Y=";
      };
    };
  });
  meta = {
    description = "The off_highway_premium_radar_sample_msgs package";
  };
})
