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
  version = "2.7.0-3";
  src = finalAttrs.passthru.sources."laser_geometry";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  propagatedBuildInputs = [ rclcpp rclpy sensor-msgs sensor-msgs-py tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-gtest ament-cmake-lint-cmake ament-cmake-pytest ament-cmake-uncrustify python-cmake-module ];
  passthru.sources = mkSourceSet (sources: {
    "laser_geometry" = substituteSource {
      src = fetchgit {
        name = "laser_geometry-source";
        url = "https://github.com/ros2-gbp/laser_geometry-release.git";
        rev = "37dcc4181306237a30f6d7139d4ba9a148b2e592";
        hash = "sha256-GSBMpUJXRXQebdpMp9Ph7mOwyPP7lg6YbgBTc6bXrXg=";
      };
    };
  });
  meta = {
    description = "This package contains a class for converting from a 2D laser scan as defined by sensor_msgs/LaserScan into a point cloud as defined by sensor_msgs/PointCloud or sensor_msgs/PointCloud2. In particular, it contains functionality to account for the skew resulting from moving robots or tilting laser scanners.";
  };
})
