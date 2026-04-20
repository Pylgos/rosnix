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
  version = "2.6.1-1";
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
        rev = "7a91ddf10dc365fc231bd8d501dfed77ab085f43";
        hash = "sha256-9TvH9+QZN0f+v0qgcF2rnbey/eAfzF0ttREpwMUe4/E=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from LiDAR datasets stored as `.bin` files in the Kitti binary format";
  };
})
