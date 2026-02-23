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
  version = "2.5.0-1";
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
        rev = "69f90ac381ce575d91603c383e07e2544a05b8cc";
        hash = "sha256-u3Tb5sWl7i/MtzIAMiC/Jp6RChAvO6tGl027uR9hTks=";
      };
    };
  });
  meta = {
    description = "CLI tool to evaluate the KITTI odometry bechmark metrics to trajectory files";
  };
})
