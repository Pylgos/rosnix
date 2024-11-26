{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros2bag,
  rosSystemPackages,
  rosbag2-compression,
  rosbag2-compression-zstd,
  rosbag2-cpp,
  rosbag2-py,
  rosbag2-storage,
  rosbag2-storage-default-plugins,
  rosbag2-test-common,
  rosbag2-tests,
  rosbag2-transport,
  shared-queues-vendor,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2";
  version = "0.26.5-1";
  src = finalAttrs.passthru.sources."rosbag2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros2bag rosbag2-compression rosbag2-compression-zstd rosbag2-cpp rosbag2-py rosbag2-storage rosbag2-storage-default-plugins rosbag2-transport shared-queues-vendor ];
  checkInputs = [ rosbag2-test-common rosbag2-tests ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosbag2" = substituteSource {
        src = fetchgit {
          name = "rosbag2-source";
          url = "https://github.com/ros2-gbp/rosbag2-release.git";
          rev = "6bbe7cbaacd88e781e2e223b7cfdbef67fd05716";
          hash = "sha256-X9BTFHfAC42EphG/I8TDx8pDBaL7MfuvOus6Pu3feXk=";
        };
      };
    });
  };
  meta = {
    description = "Meta package for rosbag2 related packages";
  };
})
