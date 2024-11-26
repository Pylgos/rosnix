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
  propagatedBuildInputs = [ velodyne-driver velodyne-laserscan velodyne-msgs velodyne-pointcloud ];
  passthru.sources = mkSourceSet (sources: {
    "velodyne" = substituteSource {
      src = fetchgit {
        name = "velodyne-source";
        url = "https://github.com/ros2-gbp/velodyne-release.git";
        rev = "21a44ac6d9c087c9094b10413abc508222baab0e";
        hash = "sha256-uivBr5TPJ5TSj9byDfctwxZes8TGiYiNWgTBRJnLcTc=";
      };
    };
  });
  meta = {
    description = "Basic ROS support for the Velodyne 3D LIDARs.";
  };
})
