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
  version = "0.29.0-1";
  src = finalAttrs.passthru.sources."rosbag2_compression";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rcpputils rcutils rosbag2-cpp rosbag2-storage ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common rclcpp rosbag2-test-common test-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosbag2_compression" = substituteSource {
        src = fetchgit {
          name = "rosbag2_compression-source";
          url = "https://github.com/ros2-gbp/rosbag2-release.git";
          rev = "2fa850895e4332769b16213f9877f43fd14926fe";
          hash = "sha256-TwkGOmIQgszQ+g6NtNXmyOEEEa8g7Wu6Pc4411a1hSA=";
        };
      };
    });
  };
  meta = {
    description = "Compression implementations for rosbag2 bags and messages.";
  };
})
