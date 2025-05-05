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
  version = "2.5.1-1";
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
        rev = "017a13143e7f432d1a7d9cb73cd05d29bdc01201";
        hash = "sha256-uivBr5TPJ5TSj9byDfctwxZes8TGiYiNWgTBRJnLcTc=";
      };
    };
  });
  meta = {
    description = "\n    Basic ROS support for the Velodyne 3D LIDARs.\n  ";
  };
})
