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
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."mola_input_kitti_dataset";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmaps ];
  passthru = {
    sources = mkSourceSet (sources: {
      "mola_input_kitti_dataset" = substituteSource {
        src = fetchgit {
          name = "mola_input_kitti_dataset-source";
          url = "https://github.com/ros2-gbp/mola-release.git";
          rev = "fb4da431511486cae64f62de4ca7e7d10e205aa4";
          hash = "sha256-3Pc4OLyG+yrZEmpDpf8xHBMaHHT2sEOobNc8PD1ZYCU=";
        };
      };
    });
  };
  meta = {
    description = "Offline RawDataSource from Kitti odometry/SLAM datasets";
  };
})
