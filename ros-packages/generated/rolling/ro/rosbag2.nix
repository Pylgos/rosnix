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
  version = "0.29.0-1";
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
          rev = "e32c0c2213442b1caee737133e7df0ba23e59b27";
          hash = "sha256-c3UYJu0AeoqCNUqe5cV7u6odIVFlRrTtgQSTe+V/oZE=";
        };
      };
    });
  };
  meta = {
    description = "Meta package for rosbag2 related packages";
  };
})
