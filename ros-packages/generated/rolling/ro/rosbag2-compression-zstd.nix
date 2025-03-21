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
  pluginlib,
  rclcpp,
  rcutils,
  rosSystemPackages,
  rosbag2-compression,
  rosbag2-test-common,
  substituteSource,
  zstd-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_compression_zstd";
  version = "0.31.0-1";
  src = finalAttrs.passthru.sources."rosbag2_compression_zstd";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib rcutils rosbag2-compression zstd-vendor ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common rclcpp rosbag2-test-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_compression_zstd" = substituteSource {
      src = fetchgit {
        name = "rosbag2_compression_zstd-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "6e064aea6340bfc916d7baaedea9f24a5114a772";
        hash = "sha256-ovjmbQst+RofXQ5iJ2UW5GLyT6Tetj5QJya7NfNCJB8=";
      };
    };
  });
  meta = {
    description = "Zstandard compression library implementation of rosbag2_compression";
  };
})
