{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cloudini-lib,
  fetchgit,
  fetchurl,
  fetchzip,
  mcap-vendor,
  mkSourceSet,
  pcl-conversions,
  pcl-ros,
  pluginlib,
  point-cloud-interfaces,
  point-cloud-transport,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rosbag2-cpp,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cloudini_ros";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."cloudini_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cloudini-lib mcap-vendor pcl-conversions pcl-ros pluginlib point-cloud-interfaces point-cloud-transport rclcpp rclcpp-components rosbag2-cpp sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cloudini-lib mcap-vendor pcl-conversions pcl-ros pluginlib point-cloud-interfaces point-cloud-transport rclcpp rclcpp-components rosbag2-cpp sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cloudini_ros" = substituteSource {
      src = fetchgit {
        name = "cloudini_ros-source";
        url = "https://github.com/facontidavide/cloudini-release.git";
        rev = "45fe4a07818ef003d0a6e6a96894c21573aa5b2e";
        hash = "sha256-gXzFn0BhfYFvk0DJALWnOJH6e5K9xP6cBQhL4RftF+o=";
      };
    };
  });
  meta = {
    description = "\n  Main library of Cloudini, the pointcloud compression library\n  ";
  };
})
