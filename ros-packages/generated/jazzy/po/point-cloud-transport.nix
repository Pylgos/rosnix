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
  version = "4.0.5-1";
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
        rev = "4c1ccaf15f86364a6dd6f8c1f41d3d8efa9ff988";
        hash = "sha256-Bs8wDhVKnA9KXYF1UNXwz9uUiHjJoj7wmj/SQahYnH4=";
      };
    };
  });
  meta = {
    description = "\n    Support for transporting PointCloud2 messages in compressed format and plugin interface for implementing additional PointCloud2 transports.\n  ";
  };
})
