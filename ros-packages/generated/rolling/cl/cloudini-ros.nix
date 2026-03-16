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
  version = "1.0.3-1";
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
        rev = "b6267e5da83304cd2ebbfad644e40f3f60cee3f8";
        hash = "sha256-azhSoI0qJoWtCHtCBuI2FNr0FKqPPxMXgWqaIGyS4AU=";
      };
    };
  });
  meta = {
    description = "\n  Main library of Cloudini, the pointcloud compression library\n  ";
  };
})
