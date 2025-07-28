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
  tf2-ros,
  tf2-ros-py,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_sensor_msgs";
  version = "0.36.13-1";
  src = finalAttrs.passthru.sources."tf2_sensor_msgs";
  nativeBuildInputs = [ ament-cmake python-cmake-module ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module geometry-msgs sensor-msgs sensor-msgs-py std-msgs tf2 tf2-ros tf2-ros-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "python3-numpy" ]; };
  buildInputs = [ ament-cmake python-cmake-module ];
  propagatedBuildInputs = [ eigen3-cmake-module geometry-msgs sensor-msgs sensor-msgs-py std-msgs tf2 tf2-ros tf2-ros-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "python3-numpy" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_sensor_msgs" = substituteSource {
      src = fetchgit {
        name = "tf2_sensor_msgs-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "0b2a037ea359e131988ae6c2fbda29378ef74138";
        hash = "sha256-1+AXmXmUpRF16ctKx73uc1ze9sog9GbthQLDetgNY5c=";
      };
    };
  });
  meta = {
    description = "\n    Small lib to transform sensor_msgs with tf. Most notably, PointCloud2\n  ";
  };
})
