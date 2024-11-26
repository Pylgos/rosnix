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
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."grid_map_pcl";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ grid-map-cmake-helpers grid-map-core grid-map-msgs grid-map-ros rclcpp rcutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcl-all" "libpcl-all-dev" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_pcl" = substituteSource {
      src = fetchgit {
        name = "grid_map_pcl-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "5b1b36c2655838e289e1f927ac0a2e5075f5ff93";
        hash = "sha256-6Xmy/TY0qJ7PmIuvbV8JBCMb/1Sr6LteahCV0M51Wuw=";
      };
    };
  });
  meta = {
    description = "Conversions between grid maps and Point Cloud Library (PCL) types.";
  };
})
