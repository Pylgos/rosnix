{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cloudini-lib,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pcl-conversions,
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
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."cloudini_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cloudini-lib pcl-conversions pluginlib point-cloud-interfaces point-cloud-transport rclcpp rclcpp-components rosbag2-cpp sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cloudini-lib pcl-conversions pluginlib point-cloud-interfaces point-cloud-transport rclcpp rclcpp-components rosbag2-cpp sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cloudini_ros" = substituteSource {
      src = fetchgit {
        name = "cloudini_ros-source";
        url = "https://github.com/facontidavide/cloudini-release.git";
        rev = "b06ba291268cb72d0207a009c75430fa6d9b7b39";
        hash = "sha256-mv10Gg5FDTgt+fPxWDUUKLNwFyDY/VPD0IOCycJ24rI=";
      };
    };
  });
  meta = {
    description = "\n  Main library of Cloudini, the pointcloud compression library\n  ";
  };
})
