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
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."kitti_metrics_eval";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mrpt-libmath mrpt-libposes mrpt-libtclap ];
  passthru = {
    sources = mkSourceSet (sources: {
      "kitti_metrics_eval" = substituteSource {
        src = fetchgit {
          name = "kitti_metrics_eval-source";
          url = "https://github.com/ros2-gbp/mola-release.git";
          rev = "b999f1db4847f8601a7ae72985e1dab43c7c7903";
          hash = "sha256-D7T/Qu4D34LpqoaQ4n72UJq2aTETkaIEOladBoMHiDY=";
        };
      };
    });
  };
  meta = {
    description = "CLI tool to evaluate the KITTI odometry bechmark metrics to trajectory files";
  };
})
