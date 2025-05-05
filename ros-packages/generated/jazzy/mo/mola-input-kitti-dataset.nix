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
  version = "1.6.4-1";
  src = finalAttrs.passthru.sources."mola_input_kitti_dataset";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmaps ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_kitti_dataset" = substituteSource {
      src = fetchgit {
        name = "mola_input_kitti_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "61ebf86219f544568aa9c6cca6157e3f5104a55e";
        hash = "sha256-rbaTGKuQRVqNx1ysASG784RFYRzg5qwLNAp7jcbY9PM=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from Kitti odometry/SLAM datasets";
  };
})
