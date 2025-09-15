{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  grid-map-cmake-helpers,
  grid-map-core,
  grid-map-msgs,
  grid-map-ros,
  mkSourceSet,
  rclcpp,
  rcutils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grid_map_pcl";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."grid_map_pcl";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ grid-map-cmake-helpers grid-map-core grid-map-msgs grid-map-ros rclcpp rcutils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libpcl-all" "libpcl-all-dev" "yaml-cpp" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ grid-map-cmake-helpers grid-map-core grid-map-msgs grid-map-ros rclcpp rcutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcl-all" "libpcl-all-dev" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_pcl" = substituteSource {
      src = fetchgit {
        name = "grid_map_pcl-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "c366d79e44fc81ab6edf9a726c40e9da20dbc758";
        hash = "sha256-AlX8wUSdwY3aOJwJzYjhQjQ0tMT9dmOpusOPrBJM2YI=";
      };
    };
  });
  meta = {
    description = "Conversions between grid maps and Point Cloud Library (PCL) types.";
  };
})
