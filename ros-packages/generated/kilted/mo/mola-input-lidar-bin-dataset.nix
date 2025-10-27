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
  version = "2.1.0-1";
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
        rev = "5ffc26368f6c99552884ce61f8b897acbc6a8b72";
        hash = "sha256-sxfjycZnmuFzEqcrgqHHY7F3BHU9z6fJ0bzc64lLcwY=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from LiDAR datasets stored as `.bin` files in the Kitti binary format";
  };
})
