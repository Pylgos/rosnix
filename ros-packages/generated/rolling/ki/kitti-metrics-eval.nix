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
  version = "1.8.1-1";
  src = finalAttrs.passthru.sources."kitti_metrics_eval";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-common mrpt-libmath mrpt-libposes mrpt-libtclap ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mrpt-libmath mrpt-libposes mrpt-libtclap ];
  passthru.sources = mkSourceSet (sources: {
    "kitti_metrics_eval" = substituteSource {
      src = fetchgit {
        name = "kitti_metrics_eval-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "369a25833337db4737567b4545a9b84a2da7bcea";
        hash = "sha256-KNedo26knIe74ZmYqi//e5lAdcH86UleW5h8mGQFzVo=";
      };
    };
  });
  meta = {
    description = "CLI tool to evaluate the KITTI odometry bechmark metrics to trajectory files";
  };
})
