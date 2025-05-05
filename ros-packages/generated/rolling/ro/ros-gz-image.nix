{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-msgs-vendor,
  gz-transport-vendor,
  image-transport,
  mkSourceSet,
  rclcpp,
  ros-gz-bridge,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_gz_image";
  version = "2.1.6-1";
  src = finalAttrs.passthru.sources."ros_gz_image";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ gz-msgs-vendor gz-transport-vendor image-transport rclcpp ros-gz-bridge sensor-msgs ];
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ gz-msgs-vendor gz-transport-vendor image-transport rclcpp ros-gz-bridge sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros_gz_image" = substituteSource {
      src = fetchgit {
        name = "ros_gz_image-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "8eb323561cf6b7cbd0872dd5840459a1e9eaa3b7";
        hash = "sha256-UKqmlMqeSIIrq42IZo/QCG91BL/WBqODhAecff2qass=";
      };
    };
  });
  meta = {
    description = "Image utilities for Gazebo simulation with ROS.";
  };
})
