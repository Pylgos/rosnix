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
  version = "0.26.6-1";
  src = finalAttrs.passthru.sources."rosbag2_storage_default_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosbag2-storage-mcap rosbag2-storage-sqlite3 ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_storage_default_plugins" = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage_default_plugins-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "75d8ac3cd6ce3344c82bc20fd727f0b8f49801ea";
        hash = "sha256-WiBL0FYlh/R7SDYef4gucYG4EquCG3z5g7EU2yB025A=";
      };
    };
  });
  meta = {
    description = "Intermediate metapackage to point at default storage plugin(s) for rosbag2";
  };
})
