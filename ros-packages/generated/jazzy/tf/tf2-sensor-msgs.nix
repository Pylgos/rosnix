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
  python-cmake-module,
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
  version = "0.36.18-1";
  src = finalAttrs.passthru.sources."tf2_sensor_msgs";
  nativeBuildInputs = [ ament-cmake python-cmake-module ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module geometry-msgs sensor-msgs sensor-msgs-py std-msgs tf2 tf2-ros tf2-ros-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "python3-numpy" ]; };
  buildInputs = [ ament-cmake python-cmake-module ];
  propagatedBuildInputs = [ eigen3-cmake-module geometry-msgs sensor-msgs sensor-msgs-py std-msgs tf2 tf2-ros tf2-ros-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "python3-numpy" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common rclcpp tf2-geometry-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_sensor_msgs" = substituteSource {
      src = fetchgit {
        name = "tf2_sensor_msgs-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "9508a8c6bbb3aa7362390525ac12c66800123bb9";
        hash = "sha256-HMxKJasHcyM2fcnZSCdataRX8HWdGvSlGh28YYaFj4M=";
      };
    };
  });
  meta = {
    description = "\n    Small lib to transform sensor_msgs with tf. Most notably, PointCloud2\n  ";
  };
})
