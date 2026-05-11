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
  zstd-cmake-module,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_compression_zstd";
  version = "0.34.0-1";
  src = finalAttrs.passthru.sources."rosbag2_compression_zstd";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ pluginlib rcutils rosbag2-compression zstd-cmake-module ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib rcutils rosbag2-compression zstd-cmake-module ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common rclcpp rosbag2-test-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_compression_zstd" = substituteSource {
      src = fetchgit {
        name = "rosbag2_compression_zstd-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "52647b2cd75276a62b071ce1a5766cbb8621b79f";
        hash = "sha256-PdGE9D0L0+pueDwDdCIVONShDSywKEqq4VLBJzcZu3Y=";
      };
    };
  });
  meta = {
    description = "Zstandard compression library implementation of rosbag2_compression";
  };
})
