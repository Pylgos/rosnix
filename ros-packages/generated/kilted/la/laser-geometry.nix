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
  version = "2.10.2-1";
  src = finalAttrs.passthru.sources."laser_geometry";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module rclcpp rclpy sensor-msgs sensor-msgs-py tf2 ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "python3-numpy" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ eigen3-cmake-module rclcpp rclpy sensor-msgs sensor-msgs-py tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "python3-numpy" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "laser_geometry" = substituteSource {
      src = fetchgit {
        name = "laser_geometry-source";
        url = "https://github.com/ros2-gbp/laser_geometry-release.git";
        rev = "b5ae1c1914bebb992e16178cecad536205101a83";
        hash = "sha256-UyGOPiVGHnZZ6cy69Jn9yp6sGuJlOTVN2iEnrPVnMPQ=";
      };
    };
  });
  meta = {
    description = "\n    This package contains a class for converting from a 2D laser scan as defined by\n    sensor_msgs/LaserScan into a point cloud as defined by sensor_msgs/PointCloud\n    or sensor_msgs/PointCloud2. In particular, it contains functionality to account\n    for the skew resulting from moving robots or tilting laser scanners.\n  ";
  };
})
