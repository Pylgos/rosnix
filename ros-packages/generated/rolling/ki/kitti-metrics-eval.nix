{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mrpt-libmath,
  mrpt-libposes,
  mrpt-libtclap,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "kitti_metrics_eval";
  version = "1.5.1-1";
  src = finalAttrs.passthru.sources."kitti_metrics_eval";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mrpt-libmath mrpt-libposes mrpt-libtclap ];
  passthru.sources = mkSourceSet (sources: {
    "kitti_metrics_eval" = substituteSource {
      src = fetchgit {
        name = "kitti_metrics_eval-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "08338b829abcfe827eae82ed805c71712cd3270d";
        hash = "sha256-KyvHz2/lQrQfVTh0D/zxSOzsG86wJ9A6dVJzlJOi1qE=";
      };
    };
  });
  meta = {
    description = "CLI tool to evaluate the KITTI odometry bechmark metrics to trajectory files";
  };
})
