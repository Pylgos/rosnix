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
  filters,
  grid-map-cmake-helpers,
  grid-map-core,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grid_map_cv";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."grid_map_cv";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge filters grid-map-cmake-helpers grid-map-core pluginlib rclcpp sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge filters grid-map-cmake-helpers grid-map-core pluginlib rclcpp sensor-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_cv" = substituteSource {
      src = fetchgit {
        name = "grid_map_cv-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "1c814bd4cee60e3946f1c5f6995fe0c90b51b74a";
        hash = "sha256-ZGP1XJbktEi5HG0mXm07X6O7fvJJMDNeBiW6MnjFq5s=";
      };
    };
  });
  meta = {
    description = "Conversions between grid maps and OpenCV images.";
  };
})
