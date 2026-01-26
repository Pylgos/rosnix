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
  version = "5.1.6-1";
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
        rev = "d3dfa8731eb776b089280c0a8bf4ca39fb28a018";
        hash = "sha256-wZ7X1tBN2Iux7jhi+7ZP6yuUjPJXLlMiVZodkzLO7Tw=";
      };
    };
  });
  meta = {
    description = "\n    Support for transporting PointCloud2 messages in compressed format and plugin interface for implementing additional PointCloud2 transports.\n  ";
  };
})
