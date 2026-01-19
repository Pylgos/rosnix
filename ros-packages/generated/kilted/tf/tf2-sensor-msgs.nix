{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  sensor-msgs-py,
  std-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  tf2-ros-py,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_sensor_msgs";
  version = "0.41.6-1";
  src = finalAttrs.passthru.sources."tf2_sensor_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module geometry-msgs sensor-msgs sensor-msgs-py std-msgs tf2 tf2-ros tf2-ros-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "python3-numpy" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ eigen3-cmake-module geometry-msgs sensor-msgs sensor-msgs-py std-msgs tf2 tf2-ros tf2-ros-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "python3-numpy" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common rclcpp tf2-geometry-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_sensor_msgs" = substituteSource {
      src = fetchgit {
        name = "tf2_sensor_msgs-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "3d80a8da2a2c298a13e566ddb184d3100ce554c8";
        hash = "sha256-UlrUOK5LOVx5P2USlh/IfTMgxrdlwinYJwwF4SfKETA=";
      };
    };
  });
  meta = {
    description = "\n    Small lib to transform sensor_msgs with tf. Most notably, PointCloud2\n  ";
  };
})
