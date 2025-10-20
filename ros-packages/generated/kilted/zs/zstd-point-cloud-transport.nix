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
  version = "5.0.2-1";
  src = finalAttrs.passthru.sources."zstd_point_cloud_transport";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ pluginlib point-cloud-interfaces point-cloud-transport rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libzstd-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib point-cloud-interfaces point-cloud-transport rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libzstd-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "zstd_point_cloud_transport" = substituteSource {
      src = fetchgit {
        name = "zstd_point_cloud_transport-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport_plugins-release.git";
        rev = "d95b71893f7a7153d4f9af8f6ee92e87a3072e07";
        hash = "sha256-uFSQKDHuNwkQ4qS3g5ZDDPWsSSb5R1dD2/fpnb34jKY=";
      };
    };
  });
  meta = {
    description = "\n    zstd_point_cloud_transport provides a plugin to point_cloud_transport for sending point clouds\n    encoded with lib\n  ";
  };
})
