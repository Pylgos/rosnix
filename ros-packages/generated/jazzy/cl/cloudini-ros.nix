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
  version = "1.0.4-1";
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
        rev = "7dfd777a5da9160e3614ff0ff56f5be0205fbbe1";
        hash = "sha256-XQdMP6zf0kqpR5VgVY2Fu6sYuuBWyhR4Exugd72aA6I=";
      };
    };
  });
  meta = {
    description = "\n  Main library of Cloudini, the pointcloud compression library\n  ";
  };
})
