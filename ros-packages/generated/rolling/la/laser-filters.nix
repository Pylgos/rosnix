{
  ament-cmake-auto,
  ament-cmake-gtest,
  angles,
  buildAmentCmakePackage,
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
  version = "2.0.8-1";
  src = finalAttrs.passthru.sources."laser_filters";
  propagatedNativeBuildInputs = [ ament-cmake-auto angles filters laser-geometry message-filters pluginlib rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs tf2 tf2-geometry-msgs tf2-kdl tf2-ros ];
  propagatedBuildInputs = [ ament-cmake-auto angles filters laser-geometry message-filters pluginlib rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs tf2 tf2-geometry-msgs tf2-kdl tf2-ros ];
  checkInputs = [ ament-cmake-gtest launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "laser_filters" = substituteSource {
      src = fetchgit {
        name = "laser_filters-source";
        url = "https://github.com/ros2-gbp/laser_filters-release.git";
        rev = "36a8c3c93d3bbf5af629627e08e59d5efb24a646";
        hash = "sha256-Bc1cNUQrKbt8+u8y1570r5HxdO+y5v+XtllestWocm8=";
      };
    };
  });
  meta = {
    description = "\n    Assorted filters designed to operate on 2D planar laser scanners,\n    which use the sensor_msgs/LaserScan type.\n  ";
  };
})
