{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  point-cloud-interfaces,
  point-cloud-transport,
  rclcpp,
  rcpputils,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "draco_point_cloud_transport";
  version = "6.1.0-2";
  src = finalAttrs.passthru.sources."draco_point_cloud_transport";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ pluginlib point-cloud-interfaces point-cloud-transport rclcpp rcpputils sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libdraco-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib point-cloud-interfaces point-cloud-transport rclcpp rcpputils sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libdraco-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "draco_point_cloud_transport" = substituteSource {
      src = fetchgit {
        name = "draco_point_cloud_transport-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport_plugins-release.git";
        rev = "73707864f88f917de3e1d25ffa0b758aab879eb1";
        hash = "sha256-NrX9WGHDoMHBTDiD9WLP5XQl4xNZDP7Da6cPpIxv938=";
      };
    };
  });
  meta = {
    description = "\n    draco_point_cloud_transport provides a plugin to point_cloud_transport for sending point clouds\n    encoded with KD tree compression.\n  ";
  };
})
