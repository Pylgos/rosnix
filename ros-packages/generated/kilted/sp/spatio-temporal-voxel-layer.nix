{
  ament-cmake,
  ament-lint-auto,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  laser-geometry,
  message-filters,
  mkSourceSet,
  nav2-costmap-2d,
  openvdb-vendor,
  pcl-conversions,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
  tf2-sensor-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "spatio_temporal_voxel_layer";
  version = "2.6.2-1";
  src = finalAttrs.passthru.sources."spatio_temporal_voxel_layer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs laser-geometry message-filters nav2-costmap-2d openvdb-vendor pcl-conversions pluginlib rclcpp rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs std-srvs tf2-geometry-msgs tf2-ros tf2-sensor-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopenexr-dev" "libpcl-all-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs laser-geometry message-filters nav2-costmap-2d openvdb-vendor pcl-conversions pluginlib rclcpp rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs std-srvs tf2-geometry-msgs tf2-ros tf2-sensor-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopenexr-dev" "libpcl-all-dev" ]; };
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "spatio_temporal_voxel_layer" = substituteSource {
      src = fetchgit {
        name = "spatio_temporal_voxel_layer-source";
        url = "https://github.com/SteveMacenski/spatio_temporal_voxel_layer-release.git";
        rev = "3eab6752aeeba64b958df8d3900b8cc5a577b960";
        hash = "sha256-NHcojaw2pkO4TCfFvRV50MtaKX23dg11YQBU1oW2xRo=";
      };
    };
  });
  meta = {
    description = "The spatio-temporal 3D obstacle costmap package";
  };
})
