{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  message-filters,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rcpputils,
  rmw,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "point_cloud_transport";
  version = "5.2.0-1";
  src = finalAttrs.passthru.sources."point_cloud_transport";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ message-filters pluginlib rclcpp rclcpp-components rcpputils rmw sensor-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ message-filters pluginlib rclcpp rclcpp-components rcpputils rmw sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "point_cloud_transport" = substituteSource {
      src = fetchgit {
        name = "point_cloud_transport-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport-release.git";
        rev = "9ad9d04f1e74db5e2e7bfe72f3a241063ff9e829";
        hash = "sha256-kVOpxH3Op1dH4kr0kDmCjkfTQdDScXFgDKaB+UE9xZI=";
      };
    };
  });
  meta = {
    description = "\n    Support for transporting PointCloud2 messages in compressed format and plugin interface for implementing additional PointCloud2 transports.\n  ";
  };
})
