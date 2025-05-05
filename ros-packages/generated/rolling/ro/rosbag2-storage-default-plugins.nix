{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosbag2-storage-mcap,
  rosbag2-storage-sqlite3,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_storage_default_plugins";
  version = "0.33.0-1";
  src = finalAttrs.passthru.sources."rosbag2_storage_default_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosbag2-storage-mcap rosbag2-storage-sqlite3 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosbag2-storage-mcap rosbag2-storage-sqlite3 ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_storage_default_plugins" = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage_default_plugins-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "575dc2dd83f1de33d5120f7c19d9f387a0e1c71a";
        hash = "sha256-07zGFxuSFpxzg133GfAtRlA/yaQ8JRJD95wyzMVdYmM=";
      };
    };
  });
  meta = {
    description = "Intermediate metapackage to point at default storage plugin(s) for rosbag2";
  };
})
