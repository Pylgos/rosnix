{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mola-kernel,
  mrpt-libmaps,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_input_lidar_bin_dataset";
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."mola_input_lidar_bin_dataset";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-common mola-kernel mrpt-libmaps ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmaps ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_lidar_bin_dataset" = substituteSource {
      src = fetchgit {
        name = "mola_input_lidar_bin_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "087057dda5cd516b797b6f76b9774c640118d9bc";
        hash = "sha256-f3QiK4jXaHMmfFvm6DyqHNyBvIUBvTxqEjxWlolBk5Y=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from LiDAR datasets stored as `.bin` files in the Kitti binary format";
  };
})
