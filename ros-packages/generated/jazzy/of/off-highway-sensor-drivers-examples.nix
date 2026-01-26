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
  version = "1.0.0-1";
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
        rev = "9b6b6f9d9ee1d607cc675d988ec58ecdd160d669";
        hash = "sha256-Jt93gNSLn653wk/VvuO36n6KYCc9pAGnJU/H7KTWDlo=";
      };
    };
  });
  meta = {
    description = "The off_highway_sensor_drivers_examples package";
  };
})
