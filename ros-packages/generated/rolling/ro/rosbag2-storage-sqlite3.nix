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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_storage_sqlite3";
  version = "0.34.0-1";
  src = finalAttrs.passthru.sources."rosbag2_storage_sqlite3";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ pluginlib rcpputils rcutils rosbag2-storage ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libsqlite3-dev" "yaml-cpp" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ pluginlib rcpputils rcutils rosbag2-storage ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libsqlite3-dev" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common rosbag2-test-common std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_storage_sqlite3" = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage_sqlite3-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "72df8224c23efc371d110a66cb4f3243dbe3fd3a";
        hash = "sha256-efItbFPFyuU0zTx8KbjoAlhE5B/z/YJk09QSTHfRi8s=";
      };
    };
  });
  meta = {
    description = "ROSBag2 SQLite3 storage plugin";
  };
})
