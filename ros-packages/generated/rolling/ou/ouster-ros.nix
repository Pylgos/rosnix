{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  class-loader,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch,
  launch-ros,
  mkSourceSet,
  ouster-sensor-msgs,
  pcl-conversions,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-eigen,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ouster_ros";
  version = "0.14.2-2";
  src = finalAttrs.passthru.sources."ouster_ros";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ class-loader cv-bridge geometry-msgs launch launch-ros ouster-sensor-msgs pcl-conversions rclcpp rclcpp-components rclcpp-lifecycle rosidl-default-runtime sensor-msgs std-msgs std-srvs tf2-eigen tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" "eigen" "libjsoncpp" "libjsoncpp-dev" "libpcl-all-dev" "libtins-dev" "libzip-dev" "spdlog" ]; };
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ class-loader cv-bridge geometry-msgs launch launch-ros ouster-sensor-msgs pcl-conversions rclcpp rclcpp-components rclcpp-lifecycle rosidl-default-runtime sensor-msgs std-msgs std-srvs tf2-eigen tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "curl" "eigen" "libjsoncpp" "libjsoncpp-dev" "libpcl-all-dev" "libtins-dev" "libzip-dev" "spdlog" ]; };
  checkInputs = [ ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ouster_ros" = substituteSource {
      src = fetchgit {
        name = "ouster_ros-source";
        url = "https://github.com/ros2-gbp/ouster-ros-release.git";
        rev = "791a8715fee70b86a9d3687110763caef2641fc9";
        hash = "sha256-M3s4q8LHqVCyoZ2UasCJ7vqtLe3kcftKFMtb676JOYE=";
      };
    };
  });
  meta = {
    description = "Ouster ROS2 driver";
  };
})
