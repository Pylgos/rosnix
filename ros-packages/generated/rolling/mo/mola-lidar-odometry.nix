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
  version = "0.4.0-1";
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
        rev = "2a4ee86b6064dfa4e12afdba201f892e6af9ee80";
        hash = "sha256-lYbE2sdetaqrepCgw7z3CBNh6gYnUuIDv0xrigAxEfk=";
      };
    };
  });
  meta = {
    description = "LIDAR odometry system based on MOLA and MRPT components";
  };
})
