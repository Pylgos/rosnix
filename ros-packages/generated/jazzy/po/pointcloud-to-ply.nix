{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pcl-conversions,
  pcl-ros,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pointcloud_to_ply";
  version = "0.0.7-2";
  src = finalAttrs.passthru.sources."pointcloud_to_ply";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ pcl-conversions pcl-ros rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libpcl-all-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pcl-conversions pcl-ros rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcl-all-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pointcloud_to_ply" = substituteSource {
      src = fetchgit {
        name = "pointcloud_to_ply-source";
        url = "https://github.com/li9i/pointcloud-to-ply-release.git";
        rev = "787178a681438d0dde2ee26c2b73f2efb542b759";
        hash = "sha256-d4PP2v2GiBtlXmYLj4B+FgaTe8jFY5Yq9xTc9Ccrm1E=";
      };
    };
  });
  meta = {
    description = "Subscribe to a PointCloud2 topic, reconstruct a mesh, and save to OBJ/PLY using PCL.";
  };
})
