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
  version = "0.29.0-1";
  src = finalAttrs.passthru.sources."rosbag2_storage_default_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosbag2-storage-mcap rosbag2-storage-sqlite3 ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosbag2_storage_default_plugins" = substituteSource {
        src = fetchgit {
          name = "rosbag2_storage_default_plugins-source";
          url = "https://github.com/ros2-gbp/rosbag2-release.git";
          rev = "c6be948ed2c3e08c153102e5f0136acdd91744cc";
          hash = "sha256-qYKofx+YsiUi5fB0miblbrQfohN2A1NR/n3CxeRQ2yM=";
        };
      };
    });
  };
  meta = {
    description = "Intermediate metapackage to point at default storage plugin(s) for rosbag2";
  };
})
