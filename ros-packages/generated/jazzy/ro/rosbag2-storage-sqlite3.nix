{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rcpputils,
  rcutils,
  rosSystemPackages,
  rosbag2-storage,
  rosbag2-test-common,
  sqlite3-vendor,
  std-msgs,
  substituteSource,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_storage_sqlite3";
  version = "0.26.5-1";
  src = finalAttrs.passthru.sources."rosbag2_storage_sqlite3";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ pluginlib rcpputils rcutils rosbag2-storage sqlite3-vendor yaml-cpp-vendor ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common rosbag2-test-common std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosbag2_storage_sqlite3" = substituteSource {
        src = fetchgit {
          name = "rosbag2_storage_sqlite3-source";
          url = "https://github.com/ros2-gbp/rosbag2-release.git";
          rev = "0c0a95d0b7e332737d5559404d353cb79733fa84";
          hash = "sha256-EWa4D/YcZ+/NYrlfhuyEOHPCtCYIGL+DnXmtsgVg260=";
        };
      };
    });
  };
  meta = {
    description = "ROSBag2 SQLite3 storage plugin";
  };
})
