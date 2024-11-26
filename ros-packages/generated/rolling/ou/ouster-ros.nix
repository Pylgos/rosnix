{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch,
  launch-ros,
  mkSourceSet,
  ouster-sensor-msgs,
  pcl-conversions,
  pcl-ros,
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
  version = "0.11.1-5";
  src = finalAttrs.passthru.sources."ouster_ros";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" ]; };
  propagatedBuildInputs = [ geometry-msgs launch launch-ros ouster-sensor-msgs pcl-conversions pcl-ros rclcpp rclcpp-components rclcpp-lifecycle rosidl-default-runtime sensor-msgs std-msgs std-srvs tf2-eigen tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libjsoncpp" "libjsoncpp-dev" "libpcl-all-dev" "libtins-dev" "spdlog" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ouster_ros" = substituteSource {
      src = fetchgit {
        name = "ouster_ros-source";
        url = "https://github.com/ros2-gbp/ouster-ros-release.git";
        rev = "4c1bb0e902c3051d32a63320ce79cc5a55109263";
        hash = "sha256-Opx0mFprXiIgty9hc+lRjuMa4S82Wsjq0scFsO4oWbs=";
      };
    };
  });
  meta = {
    description = "Ouster ROS2 driver";
  };
})
