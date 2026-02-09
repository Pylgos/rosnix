{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
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
  pname = "off_highway_radar_msgs";
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."off_highway_radar_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_radar_msgs" = substituteSource {
      src = fetchgit {
        name = "off_highway_radar_msgs-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "fa77d1f2d3ba954f9e661eaa0f397567f1953132";
        hash = "sha256-bdlwGzRnT2aLuvuC6NMkzN/XJcnRI2wfsrGy9EZbm1M=";
      };
    };
  });
  meta = {
    description = "The off_highway_radar_msgs package";
  };
})
