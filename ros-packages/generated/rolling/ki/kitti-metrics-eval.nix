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
  version = "1.9.0-1";
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
        rev = "f66e5dc0555b8983cd9f67d62393a87d2aa3c763";
        hash = "sha256-Bd7YySHLEUyWUO5bY9J97GGlEsrbzHWEpPzPzJb0DX0=";
      };
    };
  });
  meta = {
    description = "CLI tool to evaluate the KITTI odometry bechmark metrics to trajectory files";
  };
})
