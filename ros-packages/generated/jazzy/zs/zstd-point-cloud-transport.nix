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
  version = "4.0.2-1";
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
        rev = "9492bf667f341b06a95aa149f5efa9ae98ed603d";
        hash = "sha256-1QsZTEn6A5coprb+NOkMc9AHPCzNI1O8TGsHdYUzAts=";
      };
    };
  });
  meta = {
    description = "\n    zstd_point_cloud_transport provides a plugin to point_cloud_transport for sending point clouds\n    encoded with lib\n  ";
  };
})
