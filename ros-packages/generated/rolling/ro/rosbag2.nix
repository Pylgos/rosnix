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
  version = "0.33.1-1";
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
        rev = "a677bca4f2066020330b125815cb36e653c9fadf";
        hash = "sha256-7GziyldednkwmL6q96fWlcqrheX1L6+a8EDgVWw2oyk=";
      };
    };
  });
  meta = {
    description = "Meta package for rosbag2 related packages";
  };
})
