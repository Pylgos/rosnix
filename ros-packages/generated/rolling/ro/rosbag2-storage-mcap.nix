{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-gmock,
  ament-cmake-python,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mcap-vendor,
  mkSourceSet,
  pluginlib,
  rcutils,
  rosSystemPackages,
  rosbag2-storage,
  rosbag2-test-common,
  std-msgs,
  substituteSource,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_storage_mcap";
  version = "0.29.0-1";
  src = finalAttrs.passthru.sources."rosbag2_storage_mcap";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ ament-index-cpp mcap-vendor pluginlib rcutils rosbag2-storage yaml-cpp-vendor ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-gmock ament-lint-auto ament-lint-common rosbag2-test-common std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosbag2_storage_mcap" = substituteSource {
        src = fetchgit {
          name = "rosbag2_storage_mcap-source";
          url = "https://github.com/ros2-gbp/rosbag2-release.git";
          rev = "6a37ba2418e00603de8db54592977a0497817cf2";
          hash = "sha256-o3OkhTzf6Kb2LetVZ1UUnAJjGsY+o9Zm6tDc2PcKo98=";
        };
      };
    });
  };
  meta = {
    description = "rosbag2 storage plugin using the MCAP file format";
  };
})
