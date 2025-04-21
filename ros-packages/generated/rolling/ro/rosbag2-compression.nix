{
  ament-cmake,
  ament-cmake-gmock,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rcpputils,
  rcutils,
  rosSystemPackages,
  rosbag2-cpp,
  rosbag2-storage,
  rosbag2-test-common,
  substituteSource,
  test-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_compression";
  version = "0.32.0-1";
  src = finalAttrs.passthru.sources."rosbag2_compression";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rcpputils ];
  propagatedBuildInputs = [ rcutils rosbag2-cpp rosbag2-storage ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common rclcpp rosbag2-test-common test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_compression" = substituteSource {
      src = fetchgit {
        name = "rosbag2_compression-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "7582e4c718a3f0987d42979b370f915792f4d262";
        hash = "sha256-XZ9i41cqsAd1oHjq0zCncr9JSp30akSzPpOgOPwBJk4=";
      };
    };
  });
  meta = {
    description = "Compression implementations for rosbag2 bags and messages.";
  };
})
