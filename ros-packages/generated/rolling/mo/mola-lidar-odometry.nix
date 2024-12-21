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
  mola-navstate-fuse,
  mola-pose-list,
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
  version = "0.4.1-1";
  src = finalAttrs.passthru.sources."mola_lidar_odometry";
  nativeBuildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-xmllint ros-environment ];
  propagatedBuildInputs = [ mola-common mola-input-kitti360-dataset mola-input-kitti-dataset mola-input-mulran-dataset mola-input-paris-luco-dataset mola-input-rawlog mola-input-rosbag2 mola-kernel mola-launcher mola-navstate-fuse mola-pose-list mola-viz mp2p-icp mrpt-libmaps mrpt-libtclap ];
  checkInputs = [ ament-cmake-gtest ament-cmake-xmllint ament-lint-auto ament-lint-cmake mola-metric-maps mola-test-datasets rosbag2-storage-mcap ];
  passthru.sources = mkSourceSet (sources: {
    "mola_lidar_odometry" = substituteSource {
      src = fetchgit {
        name = "mola_lidar_odometry-source";
        url = "https://github.com/ros2-gbp/mola_lidar_odometry-release.git";
        rev = "1d8b5f185d7492dafad2731804d973b047e4a05e";
        hash = "sha256-VOPhskb3kSKbyg3d2FbK/2AZMwEKAga4q3KWkKOPQBk=";
      };
    };
  });
  meta = {
    description = "LIDAR odometry system based on MOLA and MRPT components";
  };
})
