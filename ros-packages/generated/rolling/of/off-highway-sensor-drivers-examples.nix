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
  nav-msgs,
  off-highway-premium-radar,
  off-highway-radar,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "off_highway_sensor_drivers_examples";
  version = "1.3.0-2";
  src = finalAttrs.passthru.sources."off_highway_sensor_drivers_examples";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs off-highway-premium-radar off-highway-radar rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs off-highway-premium-radar off-highway-radar rclcpp rclcpp-components ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_sensor_drivers_examples" = substituteSource {
      src = fetchgit {
        name = "off_highway_sensor_drivers_examples-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "b42b8a88ce6ff38540000866140fb2b47b82bd1c";
        hash = "sha256-Klse6NvF5xwnMuKdMpUko+ZI+4mz5e2o0ZZCSNPxV5Y=";
      };
    };
  });
  meta = {
    description = "The off_highway_sensor_drivers_examples package";
  };
})
