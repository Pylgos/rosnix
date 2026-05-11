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
  version = "6.0.0-1";
  src = finalAttrs.passthru.sources."point_cloud_transport";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ message-filters pluginlib rclcpp rclcpp-components rcpputils rmw sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "tinyxml2" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ message-filters pluginlib rclcpp rclcpp-components rcpputils rmw sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "tinyxml2" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "point_cloud_transport" = substituteSource {
      src = fetchgit {
        name = "point_cloud_transport-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport-release.git";
        rev = "b07c6aef757bf7221a9e5bc887491743f4a0bb89";
        hash = "sha256-sWllXErsgKdjcJT0S+GUJaB+S9mA0WFdU/XJwPZnAOc=";
      };
    };
  });
  meta = {
    description = "\n    Support for transporting PointCloud2 messages in compressed format and plugin interface for implementing additional PointCloud2 transports.\n  ";
  };
})
