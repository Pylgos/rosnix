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
  version = "0.31.0-1";
  src = finalAttrs.passthru.sources."rosbag2_storage_default_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosbag2-storage-mcap rosbag2-storage-sqlite3 ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_storage_default_plugins" = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage_default_plugins-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "5ec044f90e225eced3189d254ad5c3b399f68417";
        hash = "sha256-l/Wp6LvdwEUFYoXMnG0ilgAlXSh0LB4NsJPMxua1g3k=";
      };
    };
  });
  meta = {
    description = "Intermediate metapackage to point at default storage plugin(s) for rosbag2";
  };
})
