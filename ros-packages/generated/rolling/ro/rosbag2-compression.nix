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
  version = "0.31.0-1";
  src = finalAttrs.passthru.sources."rosbag2_compression";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rcpputils rcutils rosbag2-cpp rosbag2-storage ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common rclcpp rosbag2-test-common test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_compression" = substituteSource {
      src = fetchgit {
        name = "rosbag2_compression-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "37fbf96beb734c0a04767b5c42fb2d13e5d78689";
        hash = "sha256-fHeaE3bkgYHiNSg+9Xz9Jd3ygwcVOLcPYajKYoq/Fko=";
      };
    };
  });
  meta = {
    description = "Compression implementations for rosbag2 bags and messages.";
  };
})
