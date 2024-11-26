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
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "zstd_point_cloud_transport";
  version = "4.0.1-1";
  src = finalAttrs.passthru.sources."zstd_point_cloud_transport";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib point-cloud-interfaces point-cloud-transport rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libzstd-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "zstd_point_cloud_transport" = substituteSource {
      src = fetchgit {
        name = "zstd_point_cloud_transport-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport_plugins-release.git";
        rev = "0d35ca2082c89ce87ebeec290ae8223306abc7d0";
        hash = "sha256-RAgGj5fZQ4dleHmWEA4Zomp+z0qKm6tp+8iVV72xlHk=";
      };
    };
  });
  meta = {
    description = "zstd_point_cloud_transport provides a plugin to point_cloud_transport for sending point clouds encoded with lib";
  };
})
