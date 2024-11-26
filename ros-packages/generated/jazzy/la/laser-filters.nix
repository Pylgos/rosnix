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
  propagatedNativeBuildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ angles filters laser-geometry message-filters pluginlib rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs tf2 tf2-geometry-msgs tf2-kdl tf2-ros ];
  checkInputs = [ ament-cmake-gtest launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "laser_filters" = substituteSource {
      src = fetchgit {
        name = "laser_filters-source";
        url = "https://github.com/ros2-gbp/laser_filters-release.git";
        rev = "9027226428db0efb963e57af7fd2ae1682457134";
        hash = "sha256-Bc1cNUQrKbt8+u8y1570r5HxdO+y5v+XtllestWocm8=";
      };
    };
  });
  meta = {
    description = "Assorted filters designed to operate on 2D planar laser scanners, which use the sensor_msgs/LaserScan type.";
  };
})
