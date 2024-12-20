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
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."mola_input_kitti_dataset";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmaps ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_kitti_dataset" = substituteSource {
      src = fetchgit {
        name = "mola_input_kitti_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "aa70f6b7dc36ba03cfc1e25d2f2fad09a91e86f7";
        hash = "sha256-zYz2+/EMPbx9QQWHt5MlrZJa0dr3oyCvUkuQqrjuD34=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from Kitti odometry/SLAM datasets";
  };
})
