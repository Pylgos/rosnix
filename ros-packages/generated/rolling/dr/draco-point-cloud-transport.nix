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
  version = "6.0.1-1";
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
        rev = "95631d0ae08279dd31dea914587e074391214ee3";
        hash = "sha256-xKGnXMCA4CEUuE5b1SomaIqm8WZ/YJ0V0W12ohuFx+k=";
      };
    };
  });
  meta = {
    description = "\n    draco_point_cloud_transport provides a plugin to point_cloud_transport for sending point clouds\n    encoded with KD tree compression.\n  ";
  };
})
