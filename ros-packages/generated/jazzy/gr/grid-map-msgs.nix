{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  grid-map-cmake-helpers,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rosidl-default-generators,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grid_map_msgs";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."grid_map_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs grid-map-cmake-helpers rclcpp std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_msgs" = substituteSource {
      src = fetchgit {
        name = "grid_map_msgs-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "478b56d5d15f3b27dc7cb9f8bb1101d66bcb9d8d";
        hash = "sha256-ES/jTKiB2zn6XveDTR7Y7+a1gtK8O+yQUMsbontFaqo=";
      };
    };
  });
  meta = {
    description = "Definition of the multi-layered grid map message type.";
  };
})
