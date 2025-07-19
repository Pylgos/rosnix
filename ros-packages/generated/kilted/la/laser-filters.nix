{
  ament-cmake-auto,
  ament-cmake-gtest,
  angles,
  buildAmentCmakePackage,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  filters,
  laser-geometry,
  launch-testing-ament-cmake,
  message-filters,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-kdl,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "laser_filters";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."laser_filters";
  propagatedNativeBuildInputs = [ ament-cmake-auto angles diagnostic-msgs diagnostic-updater filters laser-geometry message-filters pluginlib rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs tf2 tf2-geometry-msgs tf2-kdl tf2-ros ];
  propagatedBuildInputs = [ ament-cmake-auto angles diagnostic-msgs diagnostic-updater filters laser-geometry message-filters pluginlib rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs tf2 tf2-geometry-msgs tf2-kdl tf2-ros ];
  checkInputs = [ ament-cmake-gtest launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "laser_filters" = substituteSource {
      src = fetchgit {
        name = "laser_filters-source";
        url = "https://github.com/ros2-gbp/laser_filters-release.git";
        rev = "81b337777a578a77f5b4b3a0577df344fca47927";
        hash = "sha256-6HCEvzKMhd9Wm6DsHBbvDvCpqXscwKaSFmHKJgZUI10=";
      };
    };
  });
  meta = {
    description = "\n    Assorted filters designed to operate on 2D planar laser scanners,\n    which use the sensor_msgs/LaserScan type.\n  ";
  };
})
