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
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "off_highway_general_purpose_radar_msgs";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."off_highway_general_purpose_radar_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_general_purpose_radar_msgs" = substituteSource {
      src = fetchgit {
        name = "off_highway_general_purpose_radar_msgs-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "befb2e16b0786b2761f7680d1aa7f9e63e71cf35";
        hash = "sha256-I3o2t6PiJiGl/8AYqwReFyJse14tLgQ49Lva18ROGXg=";
      };
    };
  });
  meta = {
    description = "The off_highway_general_purpose_radar_msgs package";
  };
})
