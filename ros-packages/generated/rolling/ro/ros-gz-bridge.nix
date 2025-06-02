{
  actuator-msgs,
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  gps-msgs,
  gz-msgs-vendor,
  gz-transport-vendor,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ament-cmake,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  ros-gz-interfaces,
  rosSystemPackages,
  rosgraph-msgs,
  rosidl-pycommon,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-msgs,
  trajectory-msgs,
  vision-msgs,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_gz_bridge";
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."ros_gz_bridge";
  nativeBuildInputs = [ ament-cmake ament-cmake-python rosidl-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ actuator-msgs geometry-msgs gps-msgs gz-msgs-vendor gz-transport-vendor launch launch-ros nav-msgs rclcpp rclcpp-components ros-gz-interfaces rosgraph-msgs sensor-msgs std-msgs tf2-msgs trajectory-msgs vision-msgs yaml-cpp-vendor ];
  buildInputs = [ ament-cmake ament-cmake-python rosidl-pycommon ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ actuator-msgs geometry-msgs gps-msgs gz-msgs-vendor gz-transport-vendor launch launch-ros nav-msgs rclcpp rclcpp-components ros-gz-interfaces rosgraph-msgs sensor-msgs std-msgs tf2-msgs trajectory-msgs vision-msgs yaml-cpp-vendor ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common launch-ros launch-testing launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ros_gz_bridge" = substituteSource {
      src = fetchgit {
        name = "ros_gz_bridge-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "157c4110700da7e3dc96a85a81fd2413498e3881";
        hash = "sha256-JHEesY2DErtQaxolfkfLNvB/JV0D6RKMa4AU5guqXuc=";
      };
    };
  });
  meta = {
    description = "Bridge communication between ROS and Gazebo Transport";
  };
})
