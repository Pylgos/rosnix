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
  version = "0.33.1-2";
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
        rev = "9101248c60e0fd566be3777679ac0c7b5455a2fb";
        hash = "sha256-Pfca7RFOAKCF4Sbi8PZDKzlkq4p/uqBb5f3w9Y64fLA=";
      };
    };
  });
  meta = {
    description = "Intermediate metapackage to point at default storage plugin(s) for rosbag2";
  };
})
