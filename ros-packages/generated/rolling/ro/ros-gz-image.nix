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
  version = "2.1.2-1";
  src = finalAttrs.passthru.sources."ros_gz_image";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ gz-msgs-vendor gz-transport-vendor image-transport rclcpp ros-gz-bridge sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ros_gz_image" = substituteSource {
        src = fetchgit {
          name = "ros_gz_image-source";
          url = "https://github.com/ros2-gbp/ros_ign-release.git";
          rev = "be5f5e17c598dfe87bf3f0d976dfd683e6c07826";
          hash = "sha256-cXIqChYhY/2BTb68tEpX4vlHlmrDf+feVSxYcrLBpsM=";
        };
      };
    });
  };
  meta = {
    description = "Image utilities for Gazebo simulation with ROS.";
  };
})
