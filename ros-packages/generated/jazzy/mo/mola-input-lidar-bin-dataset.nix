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
  version = "2.8.0-1";
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
        rev = "4f6ef691d3591c0c33bf28d5b8dae74c78c89e10";
        hash = "sha256-WBb7ztFgGtSwPMxndH9da85MhuHcrR9BYnesnvV39Gc=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from LiDAR datasets stored as `.bin` files in the Kitti binary format";
  };
})
