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
  version = "1.2.0-1";
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
        rev = "4f20a8ff73140b23eeeeeff18aff03c93a79a780";
        hash = "sha256-mz4hSs7ZUxaZ40hDqhLVOla8sQh++Wl3ymuqy949m1A=";
      };
    };
  });
  meta = {
    description = "The off_highway_sensor_drivers_examples package";
  };
})
