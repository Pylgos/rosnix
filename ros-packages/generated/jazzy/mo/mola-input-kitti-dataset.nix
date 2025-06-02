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
  pname = "mola_input_kitti_dataset";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."mola_input_kitti_dataset";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-common mola-kernel mrpt-libmaps ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmaps ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_kitti_dataset" = substituteSource {
      src = fetchgit {
        name = "mola_input_kitti_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "821139a72d83832f1d6f1c6b3518dcd060c17d4d";
        hash = "sha256-KWfa241NczfpBQrnRUwb2hdAq5QzIw/yRlroEX4DoZ4=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from Kitti odometry/SLAM datasets";
  };
})
