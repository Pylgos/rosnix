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
  version = "0.33.0-1";
  src = finalAttrs.passthru.sources."rosbag2_storage_sqlite3";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ pluginlib rcpputils rcutils rosbag2-storage sqlite3-vendor yaml-cpp-vendor ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ pluginlib rcpputils rcutils rosbag2-storage sqlite3-vendor yaml-cpp-vendor ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common rosbag2-test-common std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_storage_sqlite3" = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage_sqlite3-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "abc1665f729753b4c194e61526bc0ae9593f4fe6";
        hash = "sha256-W9M2bKk7u5NgHyR+0kzR4IPyKNQXl0PybjZC+vh+h04=";
      };
    };
  });
  meta = {
    description = "ROSBag2 SQLite3 storage plugin";
  };
})
