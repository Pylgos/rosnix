{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  sensor-msgs-py,
  substituteSource,
  tf2,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "laser_geometry";
  version = "2.10.0-1";
  src = finalAttrs.passthru.sources."laser_geometry";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ];
  propagatedBuildInputs = [ rclcpp rclpy sensor-msgs sensor-msgs-py tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "python3-numpy" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "laser_geometry" = substituteSource {
      src = fetchgit {
        name = "laser_geometry-source";
        url = "https://github.com/ros2-gbp/laser_geometry-release.git";
        rev = "2335b87461c55e15bee5bed3f9508b7b9dd6793c";
        hash = "sha256-le97S0WkaavM+9z/WXYmYm/gp/lOydMYpB+Yjd3k9Uk=";
      };
    };
  });
  meta = {
    description = "This package contains a class for converting from a 2D laser scan as defined by sensor_msgs/LaserScan into a point cloud as defined by sensor_msgs/PointCloud or sensor_msgs/PointCloud2. In particular, it contains functionality to account for the skew resulting from moving robots or tilting laser scanners.";
  };
})
