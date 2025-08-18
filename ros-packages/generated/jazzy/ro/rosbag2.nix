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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2";
  version = "0.26.9-1";
  src = finalAttrs.passthru.sources."rosbag2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros2bag rosbag2-compression rosbag2-compression-zstd rosbag2-cpp rosbag2-py rosbag2-storage rosbag2-storage-default-plugins rosbag2-transport ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros2bag rosbag2-compression rosbag2-compression-zstd rosbag2-cpp rosbag2-py rosbag2-storage rosbag2-storage-default-plugins rosbag2-transport ];
  checkInputs = [ rosbag2-test-common rosbag2-tests ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2" = substituteSource {
      src = fetchgit {
        name = "rosbag2-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "d2bd294fca5a206703ea772afad69bb334bf2dec";
        hash = "sha256-GxoBkHQH3B6fhjoesy9910+mLxdXAEi+RvWAOt91kpA=";
      };
    };
  });
  meta = {
    description = "Meta package for rosbag2 related packages";
  };
})
