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
  version = "2.2.2-2";
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
        rev = "a7354681f2217c85529e501c600aaff789d4a69c";
        hash = "sha256-OZqJ6vkAJ2O4PFGtSarBy6Ekteh3ypJadHEaWtguHxY=";
      };
    };
  });
  meta = {
    description = "Conversions between grid maps and OpenCV images.";
  };
})
