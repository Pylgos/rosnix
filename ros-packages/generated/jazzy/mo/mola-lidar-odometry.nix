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
  mola-imu-preintegration,
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
  version = "1.3.1-1";
  src = finalAttrs.passthru.sources."mola_lidar_odometry";
  nativeBuildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-xmllint mola-common mola-imu-preintegration mola-input-kitti360-dataset mola-input-kitti-dataset mola-input-mulran-dataset mola-input-paris-luco-dataset mola-input-rawlog mola-input-rosbag2 mola-kernel mola-launcher mola-pose-list mola-state-estimation-simple mola-viz mp2p-icp mrpt-libmaps mrpt-libtclap ros-environment ];
  buildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake-xmllint mola-common mola-imu-preintegration mola-input-kitti360-dataset mola-input-kitti-dataset mola-input-mulran-dataset mola-input-paris-luco-dataset mola-input-rawlog mola-input-rosbag2 mola-kernel mola-launcher mola-pose-list mola-state-estimation-simple mola-viz mp2p-icp mrpt-libmaps mrpt-libtclap ros-environment ];
  checkInputs = [ ament-cmake-gtest ament-cmake-xmllint ament-lint-auto ament-lint-cmake mola-metric-maps mola-test-datasets rosbag2-storage-mcap ];
  passthru.sources = mkSourceSet (sources: {
    "mola_lidar_odometry" = substituteSource {
      src = fetchgit {
        name = "mola_lidar_odometry-source";
        url = "https://github.com/ros2-gbp/mola_lidar_odometry-release.git";
        rev = "ac7613736f15c0d919478922cd0499a03cf3f927";
        hash = "sha256-+o0Lv1FptGxff5KDWOZPsPmiIUJrXWGzYGvJO7MZfzI=";
      };
    };
  });
  meta = {
    description = "LIDAR odometry system based on MOLA and MRPT components";
  };
})
