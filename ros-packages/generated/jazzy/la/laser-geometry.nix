{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-cmake-pytest,
  ament-cmake-uncrustify,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-cmake-module,
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
  version = "2.7.2-1";
  src = finalAttrs.passthru.sources."laser_geometry";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module rclcpp rclpy sensor-msgs sensor-msgs-py tf2 ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "python3-numpy" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ eigen3-cmake-module rclcpp rclpy sensor-msgs sensor-msgs-py tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "python3-numpy" ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-gtest ament-cmake-lint-cmake ament-cmake-pytest ament-cmake-uncrustify python-cmake-module ];
  passthru.sources = mkSourceSet (sources: {
    "laser_geometry" = substituteSource {
      src = fetchgit {
        name = "laser_geometry-source";
        url = "https://github.com/ros2-gbp/laser_geometry-release.git";
        rev = "6d5c1dfecc1afa079b11166213904e0eafe32639";
        hash = "sha256-zeg97mtDrHJXVbnOF7lmIL/hVGif3B3OkXVPglB/wVc=";
      };
    };
  });
  meta = {
    description = "\n    This package contains a class for converting from a 2D laser scan as defined by\n    sensor_msgs/LaserScan into a point cloud as defined by sensor_msgs/PointCloud\n    or sensor_msgs/PointCloud2. In particular, it contains functionality to account\n    for the skew resulting from moving robots or tilting laser scanners.\n  ";
  };
})
