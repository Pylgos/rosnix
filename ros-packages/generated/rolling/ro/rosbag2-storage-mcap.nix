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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_storage_mcap";
  version = "0.33.1-2";
  src = finalAttrs.passthru.sources."rosbag2_storage_mcap";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-index-cpp mcap-vendor pluginlib rcutils rosbag2-storage ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ ament-index-cpp mcap-vendor pluginlib rcutils rosbag2-storage ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-gmock ament-lint-auto ament-lint-common rosbag2-test-common std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_storage_mcap" = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage_mcap-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "d9128f8778c2022e86882910757b2988f9098577";
        hash = "sha256-d982MQK42ThpteDZtpAfW3DOfP5kE0ant6xDCYDeY0g=";
      };
    };
  });
  meta = {
    description = "rosbag2 storage plugin using the MCAP file format";
  };
})
