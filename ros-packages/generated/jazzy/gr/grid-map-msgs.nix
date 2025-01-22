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
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."grid_map_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs grid-map-cmake-helpers rclcpp std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_msgs" = substituteSource {
      src = fetchgit {
        name = "grid_map_msgs-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "92210bb81eca4bb3a73f8be07eab7f8690d736e5";
        hash = "sha256-Rds0wHZY4X4wlQ9cZLQTzBsAYwHg021CcOnWlLUruvI=";
      };
    };
  });
  meta = {
    description = "Definition of the multi-layered grid map message type.";
  };
})
