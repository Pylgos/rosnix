{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  velodyne-driver,
  velodyne-laserscan,
  velodyne-msgs,
  velodyne-pointcloud,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "velodyne";
  version = "2.5.1-2";
  src = finalAttrs.passthru.sources."velodyne";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ velodyne-driver velodyne-laserscan velodyne-msgs velodyne-pointcloud ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ velodyne-driver velodyne-laserscan velodyne-msgs velodyne-pointcloud ];
  passthru.sources = mkSourceSet (sources: {
    "velodyne" = substituteSource {
      src = fetchgit {
        name = "velodyne-source";
        url = "https://github.com/ros2-gbp/velodyne-release.git";
        rev = "b46481e9427f4cb3d10f6c54d5f48d26147513c5";
        hash = "sha256-uivBr5TPJ5TSj9byDfctwxZes8TGiYiNWgTBRJnLcTc=";
      };
    };
  });
  meta = {
    description = "\n    Basic ROS support for the Velodyne 3D LIDARs.\n  ";
  };
})
