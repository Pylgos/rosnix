{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  message-filters,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-ros,
  velodyne-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "velodyne_pointcloud";
  version = "2.5.1-2";
  src = finalAttrs.passthru.sources."velodyne_pointcloud";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles diagnostic-updater geometry-msgs message-filters rclcpp rclcpp-components sensor-msgs tf2 tf2-ros velodyne-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libpcl-all-dev" "yaml-cpp" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles diagnostic-updater geometry-msgs message-filters rclcpp rclcpp-components sensor-msgs tf2 tf2-ros velodyne-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libpcl-all-dev" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-gtest ament-index-cpp ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "velodyne_pointcloud" = substituteSource {
      src = fetchgit {
        name = "velodyne_pointcloud-source";
        url = "https://github.com/ros2-gbp/velodyne-release.git";
        rev = "d316fab6e0abcbea7b998e350b029ed598d718d8";
        hash = "sha256-1Y2KKTZwRt7Abdc3Z47naRMYPYn/UyMuiTGTj8qw/eA=";
      };
    };
  });
  meta = {
    description = "\n    Point cloud conversions for Velodyne 3D LIDARs.\n  ";
  };
})
