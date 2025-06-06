{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  grid-map-cmake-helpers,
  grid-map-core,
  grid-map-cv,
  grid-map-filters,
  grid-map-loader,
  grid-map-msgs,
  grid-map-octomap,
  grid-map-ros,
  grid-map-rviz-plugin,
  grid-map-visualization,
  mkSourceSet,
  octomap-msgs,
  octomap-rviz-plugins,
  octomap-server,
  rclcpp,
  rclpy,
  rosSystemPackages,
  rviz2,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grid_map_demos";
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."grid_map_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ cv-bridge geometry-msgs grid-map-cmake-helpers grid-map-core grid-map-cv grid-map-filters grid-map-loader grid-map-msgs grid-map-octomap grid-map-ros grid-map-rviz-plugin grid-map-visualization octomap-msgs octomap-rviz-plugins octomap-server rclcpp rclpy rviz2 sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-opencv" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs grid-map-cmake-helpers grid-map-core grid-map-cv grid-map-filters grid-map-loader grid-map-msgs grid-map-octomap grid-map-ros grid-map-rviz-plugin grid-map-visualization octomap-msgs octomap-rviz-plugins octomap-server rclcpp rclpy rviz2 sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-opencv" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_demos" = substituteSource {
      src = fetchgit {
        name = "grid_map_demos-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "bf90f26f2f8fa1ac3490be05293f3b0f4ea2bdc8";
        hash = "sha256-wWSHCexHzWX6UliU4cDMWmGy0QGQZmUDu7LruWVPzxk=";
      };
    };
  });
  meta = {
    description = "Demo nodes to demonstrate the usage of the grid map library.";
  };
})
