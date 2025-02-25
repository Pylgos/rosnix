{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mola-input-kitti-dataset,
  mola-input-kitti360-dataset,
  mola-input-mulran-dataset,
  mola-input-paris-luco-dataset,
  mola-input-rawlog,
  mola-input-rosbag2,
  mola-kernel,
  mola-launcher,
  mola-metric-maps,
  mola-pose-list,
  mola-state-estimation-simple,
  mola-test-datasets,
  mola-viz,
  mp2p-icp,
  mrpt-libmaps,
  mrpt-libtclap,
  ros-environment,
  rosSystemPackages,
  rosbag2-storage-mcap,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mola_lidar_odometry";
  version = "0.7.0-1";
  src = finalAttrs.passthru.sources."mola_lidar_odometry";
  nativeBuildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-xmllint ros-environment ];
  propagatedBuildInputs = [ mola-common mola-input-kitti360-dataset mola-input-kitti-dataset mola-input-mulran-dataset mola-input-paris-luco-dataset mola-input-rawlog mola-input-rosbag2 mola-kernel mola-launcher mola-pose-list mola-state-estimation-simple mola-viz mp2p-icp mrpt-libmaps mrpt-libtclap ];
  checkInputs = [ ament-cmake-gtest ament-cmake-xmllint ament-lint-auto ament-lint-cmake mola-metric-maps mola-test-datasets rosbag2-storage-mcap ];
  passthru.sources = mkSourceSet (sources: {
    "mola_lidar_odometry" = substituteSource {
      src = fetchgit {
        name = "mola_lidar_odometry-source";
        url = "https://github.com/ros2-gbp/mola_lidar_odometry-release.git";
        rev = "ec1de8a2104a3361465d77cd614fd4162b107368";
        hash = "sha256-UT61qmVoE2iW/03MLMj6AjXNvbM3elvbnEtCR8Ivwdk=";
      };
    };
  });
  meta = {
    description = "LIDAR odometry system based on MOLA and MRPT components";
  };
})
