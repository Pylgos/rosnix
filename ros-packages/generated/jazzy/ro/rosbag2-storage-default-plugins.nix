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
  version = "0.26.5-1";
  src = finalAttrs.passthru.sources."rosbag2_storage_default_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosbag2-storage-mcap rosbag2-storage-sqlite3 ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosbag2_storage_default_plugins" = substituteSource {
        src = fetchgit {
          name = "rosbag2_storage_default_plugins-source";
          url = "https://github.com/ros2-gbp/rosbag2-release.git";
          rev = "1e8eb2f639127893c55969503cb78f8a87e936b2";
          hash = "sha256-mUgUhkghfgP6hYD4lw2A4EL5yrM+nC2R+CbbX8AE8IA=";
        };
      };
    });
  };
  meta = {
    description = "Intermediate metapackage to point at default storage plugin(s) for rosbag2";
  };
})
