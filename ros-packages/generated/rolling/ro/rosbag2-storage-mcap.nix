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
  version = "0.32.0-1";
  src = finalAttrs.passthru.sources."rosbag2_storage_mcap";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-index-cpp ];
  propagatedBuildInputs = [ mcap-vendor pluginlib rcutils rosbag2-storage yaml-cpp-vendor ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-gmock ament-lint-auto ament-lint-common rosbag2-test-common std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_storage_mcap" = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage_mcap-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "8b1337acfe056b680d23361423f2c00d996b1a1d";
        hash = "sha256-4ip9VFmuaY3+TjfhBJnfycGLqbzzage621HFUegEeP8=";
      };
    };
  });
  meta = {
    description = "rosbag2 storage plugin using the MCAP file format";
  };
})
